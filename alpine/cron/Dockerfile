FROM nowait/alpine:latest
MAINTAINER Nowait <devops@nowait.com>
RUN apk add --update ca-certificates 

COPY rancher_cron /rancher_cron
RUN chmod +x /rancher_cron
CMD ["/rancher_cron"]
