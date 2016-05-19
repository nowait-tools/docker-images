FROM nowait/erlang:latest
MAINTAINER Nowait <devops@nowait.com>

RUN apk add --update --no-cache util-linux

ENV RABBITMQ_VERSION=3.6.1 \
    RABBITMQ_DEFAULT_USER=guest \
    RABBITMQ_DEFAULT_PASS=guest \
    RABBITMQ_ERLANG_COOKIE="secret cookie here" \
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

COPY plugins/*.ez /opt/rabbitmq/plugins

VOLUME /opt/rabbitmq

EXPOSE 4369 5671 5672 15671 15672 25672

COPY docker-entrypoint.sh /
RUN chown -R rabbitmq:rabbitmq /opt/rabbitmq/plugins && \
    chmod +x /docker-entrypoint.sh

CMD ["/docker-entrypoint.sh", "rabbitmq-server"]
