FROM nowait/php:5.6-cli-alpine
MAINTAINER Nowait <devops@nowait.com>

ENV COMPOSER_VERSION=1.1.3

RUN apk add --no-cache curl php php-json php-phar php-openssl git && \
    curl -sS https://getcomposer.org/installer | php -- \
    --install-dir=/usr/local/bin --filename=composer --version=$COMPOSER_VERSION && \
    apk del curl

WORKDIR /src
VOLUME /src

ENTRYPOINT ["/usr/local/bin/composer","--ignore-platform-reqs"]
CMD ["--version"]
