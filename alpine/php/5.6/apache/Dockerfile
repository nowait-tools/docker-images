FROM nowait/alpine:3.3
MAINTAINER Nowait <devops@nowait.com>

RUN apk --no-cache add 'php-apache2<5.7' && \
    mkdir -p /run/apache2

COPY apache.conf /etc/apache2/conf.d/docker.conf

EXPOSE 80

ENTRYPOINT ["dumb-init","/usr/sbin/httpd"]
CMD ["-DFOREGROUND"]
