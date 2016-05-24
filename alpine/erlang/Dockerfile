FROM nowait/alpine:3.3
MAINTAINER Nowait <devops@nowait.com>

ENV ERLANG_PKG_VERSION=18.1-r5

RUN apk add --update --no-cache curl tar xz \
    erlang=${ERLANG_PKG_VERSION} erlang-mnesia=${ERLANG_PKG_VERSION} \
    erlang-public-key=${ERLANG_PKG_VERSION} erlang-crypto=${ERLANG_PKG_VERSION} \
    erlang-ssl=${ERLANG_PKG_VERSION} erlang-sasl=${ERLANG_PKG_VERSION} \
    erlang-asn1=${ERLANG_PKG_VERSION} erlang-inets=${ERLANG_PKG_VERSION} \
    erlang-os-mon=${ERLANG_PKG_VERSION} erlang-xmerl=${ERLANG_PKG_VERSION} \
    erlang-eldap=${ERLANG_PKG_VERSION} erlang-syntax-tools=${ERLANG_PKG_VERSION}

CMD ["erl", "-version"]
