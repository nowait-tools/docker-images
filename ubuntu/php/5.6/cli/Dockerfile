FROM nowait/ubuntu:14.04.4
MAINTAINER Nowait <devops@nowait.com>

RUN apt-get update && \
    apt-get install -y language-pack-en-base && \
    LC_ALL=en_US.UTF-8 add-apt-repository ppa:ondrej/php5-5.6 && \
    apt-get update && \
    apt-get install -y php5-cli php5-mysql && \
    apt-get clean && \
    rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*

CMD ["php","-v"]
