FROM nowait/php:7.0-cli-alpine
MAINTAINER Nowait <devops@nowait.com>

ENV COMPOSER_VERSION=1.1.2

# Currently can't install composer from a package, as it's built on php5
RUN apk add --no-cache curl php7 php7-json php7-phar php7-openssl php7-mbstring && \
    curl -sS https://getcomposer.org/installer | php7 -- \
    --install-dir=/usr/local/bin --filename=composer --version=$COMPOSER_VERSION && \
    ln -sf /usr/bin/php7 /usr/bin/php && \
    apk del curl

WORKDIR /src
VOLUME /src

ENTRYPOINT ["/usr/local/bin/composer","--ignore-platform-reqs"]
CMD ["--version"]
