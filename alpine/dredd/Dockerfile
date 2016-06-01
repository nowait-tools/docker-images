FROM apiaryio/dredd
MAINTAINER Nowait <devops@nowait.com>

RUN apk add --no-cache make py-pip docker && pip install docker-compose

RUN mkdir /src
WORKDIR /src
ADD entrypoint.sh entrypoint.sh
RUN chmod +x entrypoint.sh

ENTRYPOINT ["./entrypoint.sh"]
