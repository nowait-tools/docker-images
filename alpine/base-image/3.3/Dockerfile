FROM alpine:3.3
MAINTAINER Nowait <devops@nowait.com>

COPY dumb-init_1.0.2_amd64 /usr/local/bin/dumb-init
RUN apk --no-cache add bash

ENTRYPOINT ["dumb-init", "--single-child"]
