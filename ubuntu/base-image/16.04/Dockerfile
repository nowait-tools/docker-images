FROM ubuntu:16.04
MAINTAINER Nowait <devops@nowait.com>

COPY dumb-init_1.0.1_amd64 /usr/local/bin/dumb-init

ENTRYPOINT ["dumb-init", "--single-child"]
