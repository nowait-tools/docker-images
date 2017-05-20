#!/bin/bash

ZK=$1
MYID=1
IPADDRESS=`ip -4 addr show scope global dev eth0 | grep inet | awk '{print \$2}' | cut -d / -f 1`

cd /opt/zookeeper
if [ -n "$ZK" ]
then
  output=`./bin/zkCli.sh -server $ZK:2181 get /zookeeper/config | grep ^server`

  # extract all the zk-ids from the output
  declare -a id_list
  for x in $output
  do
    id_list+=(`echo $x | cut -d"=" -f1 | cut -d"." -f2`)
  done

  declare -a sorted_id_list
  sorted_id_list=( $(
    for el in "${id_list[@]}"
    do
      echo "$el"
    done | sort -n) )

  # get the next increasing number from the sequence
  MYID=$((${sorted_id_list[${#sorted_id_list[@]}-1]}+1))

  for line in $output
  do
    echo $line >> /opt/zookeeper/conf/zoo.cfg.dynamic
  done

  echo "server.$MYID=$IPADDRESS:2888:3888:observer;2181" >> /opt/zookeeper/conf/zoo.cfg.dynamic

  cp /opt/zookeeper/conf/zoo.cfg.dynamic /opt/zookeeper/conf/zoo.cfg.dynamic.org
  /opt/zookeeper/bin/zkServer-initialize.sh --force --myid=$MYID
  ZOO_LOG_DIR=/var/log ZOO_LOG4J_PROP='INFO,CONSOLE,ROLLINGFILE' /opt/zookeeper/bin/zkServer.sh start
  /opt/zookeeper/bin/zkCli.sh -server $ZK:2181 reconfig -add "server.$MYID=$IPADDRESS:2888:3888:participant;2181"
  /opt/zookeeper/bin/zkServer.sh stop
  ZOO_LOG_DIR=/var/log ZOO_LOG4J_PROP='INFO,CONSOLE,ROLLINGFILE' /opt/zookeeper/bin/zkServer.sh start-foreground
else
  echo "server.$MYID=$IPADDRESS:2888:3888;2181" >> /opt/zookeeper/conf/zoo.cfg.dynamic
  /opt/zookeeper/bin/zkServer-initialize.sh --force --myid=$MYID
  ZOO_LOG_DIR=/var/log ZOO_LOG4J_PROP='INFO,CONSOLE,ROLLINGFILE' /opt/zookeeper/bin/zkServer.sh start-foreground
fi
