FROM nowait/alpine:3.3
MAINTAINER Nowait <devops@nowait.com>

ENV PKG_URL="https://github.com/andyshinn/alpine-pkg-glibc/releases/download/" \
    GLIBC_VER=2.23-r1 \
    JAVA_VERSION_MAJOR=8 \
    JAVA_VERSION_MINOR=73 \
    JAVA_VERSION_BUILD=02 \
    JAVA_BASE=/usr/local/java
ENV JAVA_HOME=${JAVA_BASE}/jdk \
    JAVA_PKG=jdk
ENV PATH=${PATH}:${JAVA_HOME}/bin \
    LANG=C.UTF-8

RUN apk update && \
    apk add bash ca-certificates curl && \
    wget -q -O /etc/apk/keys/andyshinn.rsa.pub https://raw.githubusercontent.com/andyshinn/alpine-pkg-glibc/master/andyshinn.rsa.pub && \
    curl -sSL --output /tmp/glibc-${GLIBC_VER}.apk "${PKG_URL}/${GLIBC_VER}/glibc-${GLIBC_VER}.apk" && \
    curl -sSL --output /tmp/glibc-bin-${GLIBC_VER}.apk "${PKG_URL}/${GLIBC_VER}/glibc-bin-${GLIBC_VER}.apk" && \
    apk --no-cache add /tmp/glibc-${GLIBC_VER}.apk /tmp/glibc-bin-${GLIBC_VER}.apk && \
    /usr/glibc/usr/bin/ldconfig /lib /usr/glibc/usr/lib && \
    mkdir -p ${JAVA_BASE} && \
    curl -sSL --header "Cookie: oraclelicense=accept-securebackup-cookie" http://download.oracle.com/otn-pub/java/jdk/${JAVA_VERSION_MAJOR}u${JAVA_VERSION_MINOR}-b${JAVA_VERSION_BUILD}/${JAVA_PKG}-${JAVA_VERSION_MAJOR}u${JAVA_VERSION_MINOR}-linux-x64.tar.gz | tar zxf - -C $JAVA_BASE && \
    ln -s $JAVA_BASE/jdk1.${JAVA_VERSION_MAJOR}.0_${JAVA_VERSION_MINOR} ${JAVA_HOME} && \
    echo 'hosts: files mdns4_minimal [NOTFOUND=return] dns mdns4' >> /etc/nsswitch.conf && \
    rm -rf /tmp/* \
        ${JAVA_HOME}/*src.zip \
        ${JAVA_HOME}/lib/missioncontrol \
        ${JAVA_HOME}/lib/visualvm \
        ${JAVA_HOME}/lib/*javafx* \
        ${JAVA_HOME}/jre/lib/plugin.jar \
        ${JAVA_HOME}/jre/lib/ext/jfxrt.jar \
        ${JAVA_HOME}/jre/bin/javaws \
        ${JAVA_HOME}/jre/lib/javaws.jar \
        ${JAVA_HOME}/jre/lib/desktop \
        ${JAVA_HOME}/jre/plugin \
        ${JAVA_HOME}/jre/lib/deploy* \
        ${JAVA_HOME}/jre/lib/*javafx* \
        ${JAVA_HOME}/jre/lib/*jfx* \
        ${JAVA_HOME}/jre/lib/amd64/libdecora_sse.so \
        ${JAVA_HOME}/jre/lib/amd64/libprism_*.so \
        ${JAVA_HOME}/jre/lib/amd64/libfxplugins.so \
        ${JAVA_HOME}/jre/lib/amd64/libglass.so \
        ${JAVA_HOME}/jre/lib/amd64/libgstreamer-lite.so \
        ${JAVA_HOME}/jre/lib/amd64/libjavafx*.so \
        ${JAVA_HOME}/jre/lib/amd64/libjfx*.so

CMD ["java","-Djava.security.egd=file:/dev/urandom"]
