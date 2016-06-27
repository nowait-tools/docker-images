FROM nowait/php:5.6-cli-alpine
MAINTAINER Nowait <devops@nowait.com>

RUN apk --no-cache add 'php-apache2<5.7' && \
    mkdir -p /run/apache2

COPY apache.conf /etc/apache2/conf.d/docker.conf

EXPOSE 80

CMD ["/usr/sbin/httpd","-DFOREGROUND"]
