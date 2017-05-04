FROM ubuntu:14.04

ENV DEBIAN_FRONTEND noninteractive

RUN apt-get update && apt-get -y -q install software-properties-common python-software-properties
RUN add-apt-repository ppa:adiscon/v8-stable
RUN apt-get update && apt-get -y -q install rsyslog

RUN rm /etc/rsyslog.conf

COPY rsyslog.conf /etc/rsyslog.conf
COPY entrypoint.sh /entrypoint.sh

RUN ln -sf /dev/stdout /var/log/syslog \
    && chmod +x /entrypoint.sh

ENV LOGZIO_TOKEN="sample token" \
    TYPE="TYPE" \
    LOG_FORMAT="json"

ENTRYPOINT ["/entrypoint.sh"]
