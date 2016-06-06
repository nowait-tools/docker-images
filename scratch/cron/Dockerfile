FROM nowait/alpine:latest
MAINTAINER Nowait <devops@nowait.com>

COPY rancher_cron /rancher_cron
RUN chmod +x /rancher_cron
CMD ["/rancher_cron"]
