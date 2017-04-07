# All credit goes to https://github.com/fr3nd/docker-percona-toolkit .  This dockerfile
# is a small addition of jq on top of fr3nd's existing image.
FROM debian:jessie

RUN apt-get update && apt-get install -y \
      libdbd-mysql-perl \
      libdbi-perl \
      libio-socket-ssl-perl \
      libterm-readkey-perl \
      perl \
      wget \
      && rm -rf /usr/share/doc/* && \
      rm -rf /usr/share/info/* && \
      rm -rf /tmp/* && \
      rm -rf /var/tmp/*

ENV PERCONA_VERSION 2.2.15-2

WORKDIR /tmp
RUN wget https://www.percona.com/downloads/percona-toolkit/2.2.15/deb/percona-toolkit_${PERCONA_VERSION}_all.deb && \
    dpkg -i percona-toolkit_${PERCONA_VERSION}_all.deb && \
    rm -f percona-toolkit_${PERCONA_VERSION}_all.deb && \
    wget https://github.com/stedolan/jq/releases/download/jq-1.5/jq-linux64 && \
    mv jq-linux64 /usr/bin/jq && \
    chmod +x /usr/bin/jq

WORKDIR /
