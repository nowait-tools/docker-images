FROM alpine:3.6

ENV FLOW_VERSION=0.49.1

RUN apk add --no-cache --virtual .build-deps-flow \
     alpine-sdk \
     bash \
     linux-headers \
     m4 \
     ncurses \
     opam \
  && opam init -y \
  && eval `opam config env` \
  && opam update

RUN opam install "flowtype=${FLOW_VERSION}"

RUN ln -s /root/.opam/system/bin/flow /usr/bin/flow

VOLUME /app
WORKDIR /app

CMD ["flow", "check"]
