FROM nowait/alpine:3.3
MAINTAINER Nowait <devops@nowait.com>

RUN apk --no-cache add openjdk8-jre && \
    rm /usr/lib/jvm/java-1.8-openjdk/jre/bin/jjs && \
    rm /usr/lib/jvm/java-1.8-openjdk/jre/bin/keytool && \
    rm /usr/lib/jvm/java-1.8-openjdk/jre/bin/orbd && \
    rm /usr/lib/jvm/java-1.8-openjdk/jre/bin/pack200 && \
    rm /usr/lib/jvm/java-1.8-openjdk/jre/bin/policytool && \
    rm /usr/lib/jvm/java-1.8-openjdk/jre/bin/rmid && \
    rm /usr/lib/jvm/java-1.8-openjdk/jre/bin/rmiregistry && \
    rm /usr/lib/jvm/java-1.8-openjdk/jre/bin/servertool && \
    rm /usr/lib/jvm/java-1.8-openjdk/jre/bin/tnameserv && \
    rm /usr/lib/jvm/java-1.8-openjdk/jre/bin/unpack200 && \
    rm /usr/lib/jvm/java-1.8-openjdk/jre/lib/ext/nashorn.jar && \
    rm -rf /tmp/*

CMD ["java","-version"]
