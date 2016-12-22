#!/bin/bash

sed -i "s/%LOGZIO_TOKEN%/$LOGZIO_TOKEN/g" /etc/rsyslog.conf
sed -i "s/%TYPE%/$TYPE/g" /etc/rsyslog.conf

/usr/sbin/rsyslogd -n
