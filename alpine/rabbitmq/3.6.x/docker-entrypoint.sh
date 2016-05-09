#!/bin/bash
set -e

if [ -d "/plugins" ]; then
  # Copy all plugins into rabbitmq plugin directory
  yes | cp -rf /plugins/* /opt/rabbitmq/plugins
  chown -R rabbitmq:rabbitmq /opt/rabbitmq/plugins
fi

if [ -n "$RABBITMQ_PLUGINS" ]; then
  for plugin in $(echo $RABBITMQ_PLUGINS | tr ";" "\n")
  do
      rabbitmq-plugins enable --offline $plugin
  done
fi

# Add rabbitmq-server as command if needed
if [ "${1:0:1}" = '-' ]; then
	set -- rabbitmq-server "$@"
fi

# Drop root privileges if we are running rabbitmq-server
# allow the container to be started with `--user`
if [ "$1" = 'rabbitmq-server' -a "$(id -u)" = '0' ]; then
	set -- su-exec rabbitmq:rabbitmq "$@"
fi

# As argument is not related to rabbitmq-server,
# then assume that user wants to run his own process,
# for example a `bash` shell to explore this image
exec "$@"
