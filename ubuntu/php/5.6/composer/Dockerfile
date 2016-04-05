FROM nowait/php:5.6-cli-ubuntu
MAINTAINER Nowait <devops@nowait.com>

ENV COMPOSER_VERSION=1.0.0-beta2

RUN apt-get update && \
    apt-get install -y curl php5-json unzip && \
    apt-get clean && \
    rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/* && \
     curl -sS https://getcomposer.org/installer | php -- \
    --install-dir=/usr/local/bin --filename=composer --version=$COMPOSER_VERSION

WORKDIR /src
VOLUME /src

ENTRYPOINT ["/usr/local/bin/composer"]
CMD ["--version"]
