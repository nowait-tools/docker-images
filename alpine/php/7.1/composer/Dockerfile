FROM nowait/php:7.1.2-cli-alpine
MAINTAINER Nowait <devops@nowait.com>

ENV COMPOSER_VERSION=1.1.3

# Currently can't install composer from a package, as it's built on php5
RUN apk add --no-cache -f curl php7.1-json php7.1-phar php7.1-dom php7.1-pdo php7.1-soap php7.1-ctype \
    php7.1-mysqli php7.1-openssl php7.1-mbstring php7.1-curl git \
    && curl -sS https://getcomposer.org/installer | php -- \
    --install-dir=/usr/local/bin --filename=composer --version=$COMPOSER_VERSION \
    && apk del curl

COPY nowait.ini /etc/php7/conf.d/

WORKDIR /src
VOLUME /src

ENTRYPOINT ["/usr/local/bin/composer","--ignore-platform-reqs"]
CMD ["--version"]
