#!/bin/sh

confd -onetime -backend env
docker network connect "$COMPOSE_PROJECT_NAME"_default $HOSTNAME
dredd
