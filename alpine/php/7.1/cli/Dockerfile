FROM nowait/alpine:3.4
MAINTAINER Nowait <devops@nowait.com>

RUN echo http://dl-cdn.alpinelinux.org/alpine/edge/main >> /etc/apk/repositories && \
echo http://dl-cdn.alpinelinux.org/alpine/edge/community >> /etc/apk/repositories && \
    echo http://dl-cdn.alpinelinux.org/alpine/edge/testing >> /etc/apk/repositories && \
    apk --no-cache add 'php7.1=7.1.2-r6'

CMD ["/usr/bin/php","-v"]
