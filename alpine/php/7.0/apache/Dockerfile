FROM nowait/php:7.0.13-cli-alpine
MAINTAINER Nowait <devops@nowait.com>

RUN apk --no-cache add 'php7-apache2<7.1' && \
    mkdir -p /run/apache2 && \
    ln -s /dev/null /var/log/apache2/access_log && \
    mkdir -p /etc/apache2/conf.d/root

COPY apache.conf /etc/apache2/conf.d/docker.conf
COPY liveness.conf /etc/apache2/conf.d/
COPY liveness.php /etc/apache2/conf.d/root/

EXPOSE 80

CMD ["/usr/sbin/httpd","-DFOREGROUND"]
