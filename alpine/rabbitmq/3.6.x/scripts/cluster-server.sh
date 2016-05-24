#!/bin/bash
set -m

# When restarting a container, RabbitMQ will fail to boot with some a
# message like:
#
# Error description:
#    {could_not_start,rabbitmq_management,
#        {{shutdown,
#             {failed_to_start_child,rabbit_mgmt_sup,
#                 {'EXIT',
#                     {{shutdown,
#                          [{{already_started,<7115.1406.0>},
#                            {child,undefined,rabbit_mgmt_db,
#                                {rabbit_mgmt_db,start_link,[]},
#                                permanent,4294967295,worker,
#                                [rabbit_mgmt_db]}}]},
#                      {gen_server2,call,
#                          [<0.368.0>,{init,<0.366.0>},infinity]}}}}},
#         {rabbit_mgmt_app,start,[normal,[]]}}}
#
# This is fixed by first using the RabbitMQ Control tool to remove the
# old hostname.
echo ""
echo "Removing current hostname from cluster.  Ignore any error stating not in cluster or node is not a cluster"
echo "$CLUSTER_WITH"
echo "$HOSTNAME"
rabbitmqctl -n rabbit@$CLUSTER_WITH forget_cluster_node rabbit@$HOSTNAME
sleep 5

rabbitmq-server "$@" &
sleep 10

rabbitmqctl stop_app
rabbitmqctl join_cluster rabbit@$CLUSTER_WITH
rabbitmqctl start_app

# Bring rabbit back to the foreground for Docker management
fg
