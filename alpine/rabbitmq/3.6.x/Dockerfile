FROM nowait/erlang:latest
MAINTAINER Nowait <devops@nowait.com>

ENV RABBITMQ_VERSION=3.6.2 \
    RABBITMQ_DEFAULT_USER=guest \
    RABBITMQ_DEFAULT_PASS=guest \
    RABBITMQ_ERLANG_COOKIE="secret cookie here" \
    PATH=/opt/rabbitmq/sbin:$PATH \
    RABBITMQ_HOME=/opt/rabbitmq \
    RABBITMQ_PLUGINS=rabbitmq_management

RUN apk add --update --no-cache ca-certificates curl tar xz su-exec util-linux && \
    mkdir -p /opt/rabbitmq && \
    curl -sSL https://www.rabbitmq.com/releases/rabbitmq-server/v${RABBITMQ_VERSION}/rabbitmq-server-generic-unix-${RABBITMQ_VERSION}.tar.xz | tar -xJ -C /opt/rabbitmq --strip-components 1 && \
    rm -rf /share/**/rabbitmq*.xz && \
    addgroup -g 1999 rabbitmq && \
    adduser -SD -u 199 rabbitmq -G rabbitmq -h /opt/rabbitmq

COPY plugins /opt/rabbitmq/plugins
COPY scripts /opt/scripts

VOLUME /opt/rabbitmq

EXPOSE 4369 5671 5672 15671 15672 25672

COPY docker-entrypoint.sh /

RUN chown -R 199:1999 /opt/rabbitmq && \
    chmod +x /docker-entrypoint.sh && \
    chmod -R +x /opt/scripts

CMD ["/docker-entrypoint.sh"]
