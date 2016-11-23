# built to nowait/php:7.0-coverage

FROM nowait/php:7.0.13-cli-alpine
MAINTAINER Nowait "devops@nowait.com"

RUN apk add --no-cache -f php7-xdebug php7-phpdbg \
  php7-opcache php7-curl php7-mcrypt php7-gd php7-mbstring \
  php7-bcmath php7-redis php7-pdo_mysql php7-dom php7-mysqli \
  php7-openssl php7-ctype php7-json php7-iconv gettext curl

WORKDIR src

ENV PHP_MEMORY_LIMIT="128M"

COPY php.ini.default /etc/php7/conf.d/
COPY entrypoint.sh /entrypoint.sh
RUN chmod +x /entrypoint.sh

ENTRYPOINT ["/entrypoint.sh"]
