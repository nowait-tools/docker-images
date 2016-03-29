FROM nowait/alpine:3.3
MAINTAINER Nowait <devops@nowait.com>

RUN echo http://dl-cdn.alpinelinux.org/alpine/edge/testing >> /etc/apk/repositories && \
    apk --no-cache add 'php7<7.1'

CMD ["/usr/bin/php7","-v"]
