# percona-toolkit docker image

## Description

This is an identical image to nowait/pt except this adds a wrapper around the command that can health check the underlying pt command.  We run our applications in the Rancher container orchestration platform.  Unfortunately it can be unaware when containers exit because a given host is in a 'Reconnecting' state.  The way to avoid this is to have a health check for the container, however, Rancher does not provide non http health checks.  This docker image is to give our percona toolkit commands a health check so we can rely on Rancher to do the right thing when our containers exit!

The application that wraps the the percona toolkit and provides the http health check is [grigori](https://github.com/mark-adams/grigori).  The health check is /_healthcheck.  Please see the grigori docs for more information.

## Building the docker image

The Makefile should be used when building the docker image.  Since this image depends on grigori, the Makefile will take care of fetching the source and creating the grigori binary.  The `build` target will create the docker image.  If you need to update the docker image name or tag, they can be found in the Makefile.

## Running

It can be used exactly as nowait/pt except you might want to bind the port the health check is on to the host like the following

```
docker run -p 8080:8080 nowait/pt-http-health-check:2.2.15-2

# Using docker-machine IP
curl  192.168.99.100:8080/_healthcheck

# stdout: child process is running
```
