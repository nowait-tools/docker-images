FROM nowait/php:7.0.13-cli-alpine
MAINTAINER Nowait <devops@nowait.com>

ENV COMPOSER_VERSION=1.1.3

# Currently can't install composer from a package, as it's built on php5
RUN apk add --no-cache -f curl 'php7-json<7.1' 'php7-phar<7.1' 'php7-dom<7.1' 'php7-pdo<7.1' 'php7-soap<7.1' 'php7-ctype<7.1' \
    'php7-mysqli<7.1' 'php7-openssl<7.1' 'php7-mbstring<7.1' 'php7-curl<7.1' 'php7-xml<7.1' git \
    && curl -sS https://getcomposer.org/installer | php -- \
    --install-dir=/usr/local/bin --filename=composer --version=$COMPOSER_VERSION \
    && apk del curl

COPY nowait.ini /etc/php7/conf.d/

WORKDIR /src
VOLUME /src

ENTRYPOINT ["su-exec-entrypoint"]
CMD ["composer --version"]
