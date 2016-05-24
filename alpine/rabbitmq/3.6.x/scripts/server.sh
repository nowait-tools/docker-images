#!/bin/bash

# If specified enable any plugins
if [ -n "$RABBITMQ_PLUGINS" ]; then
  for plugin in $(echo $RABBITMQ_PLUGINS | tr "," "\n")
  do
      rabbitmq-plugins enable --offline $plugin
  done
fi

# If specified move cookie into place
if [ "$RABBITMQ_ERLANG_COOKIE" ]; then
	cookieFile='/opt/rabbitmq/.erlang.cookie'
  touch $cookieFile
  chmod 600 $cookieFile
	echo "$RABBITMQ_ERLANG_COOKIE" > "$cookieFile"
fi

#Check for ssl certificate files
ssl=
if [ "$RABBITMQ_SSL_CERT_FILE" -a "$RABBITMQ_SSL_KEY_FILE" -a "$RABBITMQ_SSL_CA_FILE" ]; then
	ssl=1
fi

#Build configuration file
touch /opt/rabbitmq/etc/rabbitmq/rabbitmq.config

configs=(
	# https://www.rabbitmq.com/configure.html
	default_pass
	default_user
	default_vhost
	ssl_ca_file
	ssl_cert_file
	ssl_key_file
  heartbeat
)

haveConfig=
for conf in "${configs[@]}"; do
	var="RABBITMQ_${conf^^}"
	val="${!var}"
	if [ "$val" ]; then
		haveConfig=1
		break
	fi
done

if [ "$haveConfig" ]; then
	cat > /opt/rabbitmq/etc/rabbitmq/rabbitmq.config<<-'EOH'
		[
		  {rabbit,
		    [
	EOH

	if [ "$ssl" ]; then
		cat >> /opt/rabbitmq/etc/rabbitmq/rabbitmq.config<<-EOS
		      { tcp_listeners, [ ] },
		      { ssl_listeners, [ 5671 ] },
		      { ssl_options,  [
		        { certfile,   "$RABBITMQ_SSL_CERT_FILE" },
		        { keyfile,    "$RABBITMQ_SSL_KEY_FILE" },
		        { cacertfile, "$RABBITMQ_SSL_CA_FILE" },
		        { verify,   verify_peer },
		        { fail_if_no_peer_cert, true } ] },
		EOS
	else
		cat >> /opt/rabbitmq/etc/rabbitmq/rabbitmq.config<<-EOS
		      { tcp_listeners, [ 5672 ] },
		      { ssl_listeners, [ ] },
		EOS
	fi

	for conf in "${configs[@]}"; do
		[ "${conf#ssl_}" = "$conf" ] || continue
		var="RABBITMQ_${conf^^}"
		val="${!var}"
		[ "$val" ] || continue
		cat >> /opt/rabbitmq/etc/rabbitmq/rabbitmq.config<<-EOC
		      {$conf, <<"$val">>},
		EOC
	done
	cat >> /opt/rabbitmq/etc/rabbitmq/rabbitmq.config<<-'EOF'
		      {loopback_users, []}
	EOF

	# If management plugin is installed, then generate config consider this
	if [ "$(rabbitmq-plugins list -m -e rabbitmq_management)" ]; then
		cat >> /opt/rabbitmq/etc/rabbitmq/rabbitmq.config<<-'EOF'
			    ]
			  },
			  { rabbitmq_management, [
			      { listener, [
		EOF

		if [ "$ssl" ]; then
			cat >> /opt/rabbitmq/etc/rabbitmq/rabbitmq.config<<-EOS
			      { port, 15671 },
			      { ssl, true },
			      { ssl_opts, [
			          { certfile,   "$RABBITMQ_SSL_CERT_FILE" },
			          { keyfile,    "$RABBITMQ_SSL_KEY_FILE" },
			          { cacertfile, "$RABBITMQ_SSL_CA_FILE" },
			      { verify,   verify_none },
			      { fail_if_no_peer_cert, false } ] } ] }
			EOS
		else
			cat >> /opt/rabbitmq/etc/rabbitmq/rabbitmq.config<<-EOS
			        { port, 15672 },
			        { ssl, false }
			        ]
			      }
			EOS
		fi
	fi

	cat >> /opt/rabbitmq/etc/rabbitmq/rabbitmq.config<<-'EOF'
		    ]
		  }
		].
	EOF

  chown rabbitmq:rabbitmq /opt/rabbitmq/etc/rabbitmq/rabbitmq.config
fi

if [ "$ssl" ]; then
	# Create combined cert
	cat "$RABBITMQ_SSL_CERT_FILE" "$RABBITMQ_SSL_KEY_FILE" > /tmp/combined.pem
	chmod 0400 /tmp/combined.pem

	# More ENV vars for make clustering happiness
	# we don't handle clustering in this script, but these args should ensure
	# clustered SSL-enabled members will talk nicely
	export ERL_SSL_PATH="$(erl -eval 'io:format("~p", [code:lib_dir(ssl, ebin)]),halt().' -noshell)"
	export RABBITMQ_SERVER_ADDITIONAL_ERL_ARGS="-pa '$ERL_SSL_PATH' -proto_dist inet_tls -ssl_dist_opt server_certfile /tmp/combined.pem -ssl_dist_opt server_secure_renegotiate true client_secure_renegotiate true"
	export RABBITMQ_CTL_ERL_ARGS="$RABBITMQ_SERVER_ADDITIONAL_ERL_ARGS"
fi

# Exeucte if deploying to Rancher
if [ $RANCHER_SERVICE_NAME ] ; then

    # Rancher service name
  echo "RANCHER_SERVICE_NAME: ${RANCHER_SERVICE_NAME}"

  # Rancher stack name
  STACK_NAME=$(curl --retry 5 --retry-delay 5 --connect-timeout 3 -s http://rancher-metadata/2015-07-25/self/stack/name)
  echo "STACK_NAME: ${STACK_NAME}"

  # Number of container instances running as part of service (i.e. scale)
  SERVICE_INSTANCES=$(curl --retry 5 --retry-delay 5 --connect-timeout 3 -s http://rancher-metadata/2015-07-25/services/${RANCHER_SERVICE_NAME}/scale)
  echo "SERVICE_INSTANCES: ${SERVICE_INSTANCES}"

  # Set RabbitMQ hostname to equal that of Container name
  export HOSTNAME=$(curl --retry 5 --retry-delay 5 --connect-timeout 3 -s http://rancher-metadata/2015-07-25/self/container/name)
  export RABBITMQ_NODENAME="rabbit@$HOSTNAME"
  echo "HOSTNAME: ${HOSTNAME}"
  echo "NODENAME: ${RABBITMQ_NODENAME}"

  # Cluster with first instance listed in service (only if mulitple instances)
  if [ $SERVICE_INSTANCES -gt 1 ]; then
    MASTER=$(curl --retry 5 --retry-delay 5 --connect-timeout 3 -s http://rancher-metadata/2015-07-25/services/${RANCHER_SERVICE_NAME}/containers/0)
    if [ $MASTER != $HOSTNAME ]; then
      export CLUSTER_WITH=$MASTER
      echo "CLUSTER_WITH: ${CLUSTER_WITH}"
    fi
  fi
fi

if [ -z "$CLUSTER_WITH" ] ; then
  	exec /opt/scripts/start-server.sh "$@"
else
  # Give master instance time to start up when launch all instances at same time via rancher-compose
  sleep 5

  if [ -f /opt/rabbitmq/.CLUSTERED ] ; then
      exec /opt/scripts/start-server.sh "$@"
  else
    # Handles container new (from scracth or after delete operation) case
    touch /opt/rabbitmq/.CLUSTERED
    exec /opt/scripts/cluster-server.sh "$@"
  fi
fi
