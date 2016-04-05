FROM nowait/ubuntu:14.04.4
MAINTAINER Nowait <devops@nowait.com>

RUN apt-get update && \
    apt-get install -y language-pack-en-base && \
    LC_ALL=en_US.UTF-8 add-apt-repository ppa:ondrej/php && \
    apt-get update && \
    apt-get install -y php7.0-cli php7.0-mysql && \
    apt-get clean && \
    rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*

CMD ["php","-v"]
