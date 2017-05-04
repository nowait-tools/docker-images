## rsyslog-logzio

This docker image is used for sending rsyslog logs to logzio.  The motivation for this image was so that we could use the docker syslog logging driver to this container which then will forward our logs to logzio.

### Usage

#### Configuration Options
- Environment variables
  - LOGZIO_TOKEN -- token that authenticates you with logzio.  can be found in your logzio account
  - TYPE -- the `type` field you want applied so logzio can identify and appropriately parse your logs
  - LOG_FORMAT -- please see the next paragraph.

Logzio provides two different endpoints for syslog: syslog and json format.  If your log messages are valid json then you can send it to the json endpoint by setting the `LOG_FORMAT` environment variable to `json`.  Any other value for the `LOG_FORMAT` environment will result in the logs being sent to the syslog format endpoint.

An example of how to run this is shown below.

```
docker run -d -p 514:514 -v /etc/hostname:/etc/hostname -e "LOGZIO_TOKEN=token" -e "TYPE=log-type" -e "LOG_FORMAT=json" nowait/rsyslog-logzio:1.1
```

You can then use the rsyslog container for the docker logging driver like so.

```
docker run -d --log-driver syslog --log-opt "syslog-address=127.0.0.1" --log-opt "tag=nginx" nginx
```

**Please note the syslog-address option specifying localhost** (If using mac please specify the docker-machine ip).  This is because the is from the perspective of the docker daemon.  If you are using a contianer orchestration platform like Rancher you cannot use dns names that your orchestration platform resolves since the docker daemon will not be able to resolve the hostname.
