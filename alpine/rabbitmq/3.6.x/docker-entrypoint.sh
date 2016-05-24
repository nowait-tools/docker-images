#!/bin/bash
set -e

if [[ $EUID -eq 0 ]]; then
  exec su-exec rabbitmq:rabbitmq /opt/scripts/server.sh "$@"
else
  exec /opt/scripts/server.sh "$@"
fi
