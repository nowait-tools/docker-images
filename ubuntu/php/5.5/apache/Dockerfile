FROM nowait/ubuntu:14.04.4
MAINTAINER Nowait <devops@nowait.com>

RUN apt-get update && \
    apt-get install -y apache2 php5 php5-mysql && \
    apt-get clean && \
    rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*

COPY apache.conf /etc/apache2/conf-available/docker.conf
COPY 000-default.conf /etc/apache2/sites-available/000-default.conf

RUN a2enconf docker && \
    a2disconf other-vhosts-access-log

EXPOSE 80

ENTRYPOINT ["dumb-init","/usr/sbin/apache2ctl"]
CMD ["-DFOREGROUND"]
