#!/bin/bash

set -e
set -x

/src/wait-for-it.sh $RABBIT_HOST:$RABBIT_PORT -s

/src/runjava.sh com.rabbitmq.examples.PerfTest -h "amqp://$RABBIT_USER:$RABBIT_PASSWORD@$RABBIT_HOST:$RABBIT_PORT" $@

