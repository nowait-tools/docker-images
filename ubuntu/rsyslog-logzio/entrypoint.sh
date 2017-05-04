#!/bin/bash

sed -i "s/%LOGZIO_TOKEN%/$LOGZIO_TOKEN/g" /etc/rsyslog.conf
sed -i "s/%TYPE%/$TYPE/g" /etc/rsyslog.conf
HOST_HOSTNAME=$(cat /etc/hostname)
sed -i "s/%HOSTNAME%/$HOST_HOSTNAME/g" /etc/rsyslog.conf

/usr/sbin/rsyslogd -n
