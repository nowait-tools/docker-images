FROM nowait/java:openjre8-alpine
MAINTAINER Nowait <devops@nowait.com>

ENV ELASTICSEARCH_VERSION=2.3.2 \
    CONFD_VERSION=0.12.0-alpha3 \
    CONFD_BACKEND=env \
    PATH=/opt/elasticsearch/bin:/opt::$PATH \
    ES_MASTER=true \
    ES_DATA=true \
    ES_DATA_PATH="./data" \
    ES_CLUSTER_NAME="" \
    ES_BOX_TYPE="" \
    ES_CLUSTER_SERVICE="ElasticSearchMaster"

RUN apk add --no-cache ca-certificates curl su-exec && \
    mkdir -p /opt && \
    cd /tmp && \
    curl https://download.elastic.co/elasticsearch/release/org/elasticsearch/distribution/tar/elasticsearch/$ELASTICSEARCH_VERSION/elasticsearch-$ELASTICSEARCH_VERSION.tar.gz > elasticsearch-$ELASTICSEARCH_VERSION.tar.gz && \
    tar -xzf elasticsearch-$ELASTICSEARCH_VERSION.tar.gz && \
    rm -rf elasticsearch-$ELASTICSEARCH_VERSION.tar.gz && \
    mv elasticsearch-$ELASTICSEARCH_VERSION /opt/elasticsearch && \
    addgroup elasticsearch && \
    adduser -SDH elasticsearch -G elasticsearch && \
    /opt/elasticsearch/bin/plugin install cloud-aws

RUN curl -L https://github.com/kelseyhightower/confd/releases/download/v$CONFD_VERSION/confd-$CONFD_VERSION-linux-amd64 > /opt/confd && \
    chmod +x /opt/confd

WORKDIR /opt/elasticsearch

RUN set -ex \
  	&& for path in \
  		$ES_DATA_PATH \
  		./plugins \
  		./logs \
  		./config \
  		./config/scripts \
      ./conf.d \
      ./templates \
  	; do \
  		mkdir -p "$path"; \
  		chown -R elasticsearch:elasticsearch "$path"; \
  	done

COPY config ./config
COPY conf.d ./conf.d
COPY templates ./templates

VOLUME /opt/elasticsearch/data

COPY docker-entrypoint.sh /
RUN chmod +x /docker-entrypoint.sh

EXPOSE 9200 9300
ENTRYPOINT ["/docker-entrypoint.sh"]
CMD ["elasticsearch"]
