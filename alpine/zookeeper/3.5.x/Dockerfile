FROM nowait/java:openjre8-alpine
MAINTAINER Mike Schroeder <mike.schroeder@nowait.com>

ENV ZOOKEEPER_VERSION 3.5.1-alpha

RUN apk add --no-cache wget bash \
    && mkdir /opt \
    && wget -q http://apache.mirrors.pair.com/zookeeper/zookeeper-${ZOOKEEPER_VERSION}/zookeeper-${ZOOKEEPER_VERSION}.tar.gz \
    && tar -xvzf zookeeper-${ZOOKEEPER_VERSION}.tar.gz \
    && mv zookeeper-${ZOOKEEPER_VERSION} /opt/zookeeper

EXPOSE 2181 2888 3888

WORKDIR /opt/zookeeper

ADD zk-init.sh /usr/local/bin/
ADD zoo.cfg /opt/zookeeper/conf/zoo.cfg

RUN chmod +x /usr/local/bin/zk-init.sh
ENTRYPOINT ["dumb-init", "/usr/local/bin/zk-init.sh"]
