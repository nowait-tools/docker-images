FROM nowait/alpine:3.3
MAINTAINER Nowait <devops@nowait.com>

RUN apk --no-cache add ca-certificates

COPY rancher-cleanup /usr/bin/rancher-cleanup
RUN chmod +x /usr/bin/rancher-cleanup

CMD ["/usr/bin/rancher-cleanup"]
