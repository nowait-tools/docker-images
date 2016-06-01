FROM apiaryio/dredd
MAINTAINER Nowait <devops@nowait.com>

RUN apk add --no-cache make py-pip docker && pip install docker-compose && wget https://github.com/kelseyhightower/confd/releases/download/v0.11.0/confd-0.11.0-linux-amd64 && mv confd-0.11.0-linux-amd64 /bin/confd && chmod +x /bin/confd

RUN mkdir /src
WORKDIR /src
ADD entrypoint.sh entrypoint.sh
RUN chmod +x entrypoint.sh

ENTRYPOINT ["./entrypoint.sh"]
