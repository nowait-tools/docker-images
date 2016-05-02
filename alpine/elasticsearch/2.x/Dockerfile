FROM nowait/java:openjre8-alpine
MAINTAINER Nowait <devops@nowait.com>

ENV ELASTICSEARCH_VERSION 2.3.2

RUN apk add --no-cache ca-certificates curl su-exec bash \
		mkdir -p /opt && \
	  cd /tmp && \
		curl https://download.elastic.co/elasticsearch/release/org/elasticsearch/distribution/tar/elasticsearch/$ELASTICSEARCH_VERSION/elasticsearch-$ELASTICSEARCH_VERSION.tar.gz > elasticsearch-$ELASTICSEARCH_VERSION.tar.gz && \
	  tar -xzf elasticsearch-$ELASTICSEARCH_VERSION.tar.gz && \
	  rm -rf elasticsearch-$ELASTICSEARCH_VERSION.tar.gz && \
	  mv elasticsearch-$ELASTICSEARCH_VERSION /opt/elasticsearch \
		addgroup elasticsearch \
		adduser -SDH elasticsearch -G elasticsearch

ENV PATH /opt/elasticsearch:$PATH

WORKDIR /opt/elasticsearch

RUN set -ex \
	&& for path in \
		./data \
		./plugins \
		./logs \
		./config \
		./config/scripts \
	; do \
		mkdir -p "$path"; \
		chown -R elasticsearch:elasticsearch "$path"; \
	done

COPY config ./config

VOLUME /opt/elasticsearch/data

COPY docker-entrypoint.sh /
RUN chmod +x /docker-entrypoint.sh

EXPOSE 9200 9300
ENTRYPOINT ["/docker-entrypoint.sh"]
CMD ["elasticsearch"]
