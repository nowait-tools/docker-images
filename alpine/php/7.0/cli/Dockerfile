FROM nowait/alpine:3.4
MAINTAINER Nowait <devops@nowait.com>

RUN echo http://dl-cdn.alpinelinux.org/alpine/edge/testing >> /etc/apk/repositories && \
    apk --no-cache add 'php7<7.1' && \
    ln -s /usr/bin/php7 /usr/bin/php

CMD ["/usr/bin/php7","-v"]
