# vim:set ft=dockerfile:
FROM ubuntu:14.04

RUN apt-get update \
    && apt-get install -y luarocks git build-essential \
    && luarocks install busted \
    && luarocks install lua-cjson \
    && luarocks install luaposix \
    && luarocks install luabitop

