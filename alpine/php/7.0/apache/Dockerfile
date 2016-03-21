FROM nowait/alpine:3.3
MAINTAINER Nowait <devops@nowait.com>

RUN echo http://dl-cdn.alpinelinux.org/alpine/edge/testing >> /etc/apk/repositories && \
    apk --no-cache add 'php7-apache2<7.1' && \
    mkdir -p /run/apache2

EXPOSE 80

ENTRYPOINT ["dumb-init","/usr/sbin/httpd"]
CMD ["-DFOREGROUND"]
