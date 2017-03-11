FROM nowait/php:7.1.2-cli-alpine
MAINTAINER Nowait <devops@nowait.com>

RUN apk --no-cache add 'php7.1-apache2' && \
    mkdir -p /run/apache2 && \
    ln -s /dev/null /var/log/apache2/access_log 

COPY apache.conf /etc/apache2/conf.d/docker.conf
COPY status.conf /etc/apache2/conf.d/status.conf

EXPOSE 80

CMD ["/usr/sbin/httpd","-DFOREGROUND"]
