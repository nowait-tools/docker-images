FROM nowait/erlang:latest
MAINTAINER Nowait <devops@nowait.com>

ENV RABBITMQ_VERSION=3.6.1 \
    RABBITMQ_USER=rabbitmq \
    RABBITMQ_PASS=rabbitmq \
    PATH=/opt/rabbitmq/sbin:$PATH \
    RABBITMQ_HOME=/opt/rabbitmq \
    RABBITMQ_PLUGINS=rabbitmq_management

RUN apk add --update --no-cache curl tar xz su-exec && \
    mkdir -p /opt/rabbitmq && \
    curl -sSL https://www.rabbitmq.com/releases/rabbitmq-server/v${RABBITMQ_VERSION}/rabbitmq-server-generic-unix-${RABBITMQ_VERSION}.tar.xz | tar -xJ -C /opt/rabbitmq --strip-components 1 && \
    rm -rf /share/**/rabbitmq*.xz && \
    apk del --purge curl tar xz && \
    addgroup rabbitmq && \
    adduser -SD rabbitmq -G rabbitmq -h /opt/rabbitmq && \
    chown -R rabbitmq:rabbitmq /opt/rabbitmq && \
    chmod 777 /opt/rabbitmq

VOLUME /opt/rabbitmq

EXPOSE 4369 5671 5672 15671 15672 25672

COPY docker-entrypoint.sh /
RUN chmod +x /docker-entrypoint.sh

CMD ["/docker-entrypoint.sh", "rabbitmq-server"]
