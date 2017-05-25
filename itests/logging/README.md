## Logging

This is a local setup for testing the fluentd and rsyslog logging shippers used in production at Nowait.  This allows for shipping logs to logzio and s3 simultaneously.  This local setup is used as a way to easily test new releases before testing the changes out in staging or production.

### Introduction

This docker-compose sets up a sample application (nginx) with the fluentd and rsyslog setup. In order to test the application you can make curl requests to nginx and should see the logs propagate to logzio and s3.

### Usage
- `cp itests/logging/docker-compose.override.yml.copy itests/logging/docker-compose.override.yml`
- Update `LOGZIO_TOKEN`, `AWS_KEY_ID` and `AWS_SEC_KEY` in `docker-compose.override.yml`
- `cd itests/logging`
- `docker-compose up -d`
- Make requests to nginx and watch logs propagate to logzio and s3
