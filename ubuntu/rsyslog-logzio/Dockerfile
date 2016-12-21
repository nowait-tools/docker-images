FROM jplock/rsyslog:8.2.2

COPY rsyslog.conf /etc/rsyslog.conf
COPY entrypoint.sh /entrypoint.sh

RUN ln -sf /dev/stdout /var/log/syslog \
    && chmod +x /entrypoint.sh

ENV LOGZIO_TOKEN="sample token" \
    TYPE="TYPE" \
    LOG_FORMAT="json"

ENTRYPOINT ["/entrypoint.sh"]
