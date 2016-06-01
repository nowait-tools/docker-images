#!/bin/sh

docker network connect "$COMPOSE_PROJECT_NAME"_default $HOSTNAME
dredd
