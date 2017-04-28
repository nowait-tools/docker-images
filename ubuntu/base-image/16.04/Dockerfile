FROM ubuntu:16.04
MAINTAINER Nowait <devops@nowait.com>

COPY dumb-init_1.0.1_amd64 /usr/local/bin/dumb-init
COPY su-exec /usr/local/bin/su-exec
COPY su-exec-entrypoint /usr/local/bin/su-exec-entrypoint
RUN chmod +x /usr/local/bin/su-exec \
    && chmod +x /usr/local/bin/su-exec-entrypoint

ENTRYPOINT ["dumb-init", "--single-child"]
