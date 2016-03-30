FROM nowait/ubuntu:14.04.4
MAINTAINER Nowait <devops@nowait.com>

RUN apt-get update && \
    apt-get install -y php5-cli php5-mysql && \
    apt-get clean && \
    rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*

CMD ["php","-v"]
