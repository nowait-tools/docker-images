#!/bin/bash
set -e

OPTS="$OPTS --es.transport.tcp.port=9300 --es.http.port=9200"

if [ -n "$ES_CLUSTER_NAME" ]; then
  OPTS="$OPTS --es.cluster.name=$ES_CLUSTER_NAME"
fi

if [ -n "$ES_MULTICAST" ]; then
  OPTS="$OPTS --es.discovery.zen.ping.multicast.enabled=$ES_MULTICAST"
fi

if [ -n "$ES_MASTER" ]; then
  OPTS="$OPTS --node.master=$ES_MASTER"
fi

if [ -n "$ES_DATA" ]; then
  OPTS="$OPTS --node.data=$ES_DATA"
fi

if [ -n "$ES_DATA_PATH" ]; then
  OPTS="$OPTS --path.data=$ES_DATA_PATH"
fi

# Compile config file templates
su-exec elasticsearch:elasticsearch confd -onetime -backend=$CONFD_BACKEND -prefix=/latest -confdir=/opt/elasticsearch

# Add elasticsearch as command if needed
if [[ $1 == -* ]]; then
	set -- elasticsearch "$@"
fi

# Drop root privileges if we are running elasticsearch
# allow the container to be started with `--user`
if [ "$1" = 'elasticsearch' -a "$(id -u)" = '0' ]; then
	# Change the ownership of /opt/elasticsearch/data to elasticsearch
	chown -R elasticsearch:elasticsearch /opt/elasticsearch/data

	set -- su-exec elasticsearch "$@"
	#exec su-exec elasticsearch "$BASH_SOURCE" "$@"
fi

# As argument is not related to elasticsearch,
# then assume that user wants to run his own process,
# for example a `bash` shell to explore this image
exec "$@" "$OPTS"
