FROM ubuntu:14.04.4
MAINTAINER Nowait <devops@nowait.com>

COPY dumb-init_1.0.1_amd64 /usr/local/bin/dumb-init

RUN apt-get install -y software-properties-common && \
    apt-get clean && \
    rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*

ENTRYPOINT ["dumb-init", "--single-child"]
