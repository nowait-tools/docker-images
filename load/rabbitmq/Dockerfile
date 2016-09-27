FROM nowait/java:openjdk8-alpine

ENV RABBIT_HOST=rabbitmq \
    RABBIT_PORT=5672 \
    RABBIT_USER=guest \
    RABBIT_PASSWORD=guest \
    CONNECT_TIMEOUT=10

WORKDIR /src
COPY . .
RUN chmod +x *.jar runjava.sh entrypoint.sh wait-for-it.sh

ENTRYPOINT ["/src/entrypoint.sh"]
