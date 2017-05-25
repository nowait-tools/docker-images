FROM fluent/fluentd:v0.12.35-debian

RUN mkdir -p /var/log/fluent/s3-buffer

RUN chmod a+rw /var/log/fluent/s3-buffer

RUN buildDeps="sudo make gcc g++ libc-dev ruby-dev" \
 && apt-get update \
 && apt-get install -y --no-install-recommends $buildDeps \
 && sudo gem install \
        fluent-plugin-s3

COPY fluent.conf /fluentd/etc/fluent.conf
