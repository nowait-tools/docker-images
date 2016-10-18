## rsyslog-logzio

This docker image is used for sending rsyslog logs to logzio.  The motivation for this image was so that we could use the docker syslog logging driver to this container which then will forward our logs to logzio.

### Usage

This image is run on every host binding port 514 to the host machine like so.

```
docker run -d -p 514:514 -e "LOGZIO_TOKEN=token" nowait/rsyslog-logzio:0.1.0
```

You can then use the rsyslog container for the docker logging driver like so.

```
docker run -d --log-driver syslog --log-opt "syslog-address=127.0.0.1" --log-opt "tag=nginx" nginx
```

**Please note the syslog-address option specifying localhost** (If using mac please specify the docker-machine ip).  This is because the is from the perspective of the docker daemon.  If you are using a contianer orchestration platform like Rancher you cannot use dns names that your orchestration platform resolves since the docker daemon will not be able to resolve the hostname.
