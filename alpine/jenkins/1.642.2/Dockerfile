FROM nowait/java:openjdk8
MAINTAINER Nowait <devops@nowait.com>

# WAR_DIR: LTS=war-stable, Latest=war
ENV JENKINS_VERSION=1.642.2 \
    JENKINS_USER=jenkins \
    JENKINS_GROUP=jenkins \
    JENKINS_HOME=/var/lib/jenkins \
    JENKINS_VOL=/opt/jenkins \
    WAR_DIR=war-stable

RUN apk --no-cache add curl ttf-dejavu git openssh && \
    mkdir -p $JENKINS_HOME $JENKINS_VOL && \
    curl -sSL http://mirrors.jenkins-ci.org/${WAR_DIR}/${JENKINS_VERSION}/jenkins.war --output ${JENKINS_VOL}/jenkins.war && \
    addgroup ${JENKINS_GROUP} && \
    adduser -h ${JENKINS_HOME} -D -s /bin/bash -G ${JENKINS_GROUP} ${JENKINS_USER} && \
    chown -R ${JENKINS_USER}:${JENKINS_GROUP} ${JENKINS_HOME} ${JENKINS_VOL} && \
    rm -rf /tmp/*

# Listen for main web interface (8080/tcp) and attached slave agents (50000/tcp)
EXPOSE 8080 50000

COPY docker-entrypoint.sh /usr/local/bin/docker-entrypoint.sh
RUN chown ${JENKINS_USER}:${JENKINS_GROUP} /usr/local/bin/docker-entrypoint.sh && \
    chmod +x /usr/local/bin/docker-entrypoint.sh

USER ${JENKINS_USER}

ENTRYPOINT ["dumb-init","/usr/local/bin/docker-entrypoint.sh"]
CMD [""]
