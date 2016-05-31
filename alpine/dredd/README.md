## Dredd docker image

This docker image is an easy way to allow services that use docker-compose to be tested via dredd.  This image is opinionated in how it should be used.  The following is to describe how to properly use this image.

The dredd image assumes the following
- dredd.yml mounted at `/src/dredd.yml` and all files needed by dredd.yml
- docker socket must be bind mounted
- `COMPOSE_PROJECT_NAME` environment variable must be set.
  - This ensures that the services started by docker-compose will be added to a network with the name `"$COMPOSE_PROJECT_NAME_"default`.  The network name must be known ahead of time so that the dredd conatiner can add itself to the network allowing dredd to make requests to the web service

### Suggestions
The hookfiles used by the dredd.yml must reset the database to a known state at the beginning of each test.  The following is an example dredd.yml, hooks.js and Makefile that accomplish this.  It is not required to use this approach but if the database is not reset to a known state at the beginning of each dredd transaction there is the potential for errors to occur relating to data state.

Dredd.yml

```yml
dry-run: null
hookfiles: hooks.js
language: nodejs
sandbox: false
server: null
server-wait: 3
init: false
custom: {}
names: false
only: []
reporter: []
output: []
header: []
sorted: false
user: null
inline-errors: true
details: false
method: []
color: true
level: info
timestamp: false
silent: false
path: []
hooks-worker-timeout: 5000
hooks-worker-connect-timeout: 1500
hooks-worker-connect-retry: 500
hooks-worker-after-connect-wait: 3000
hooks-worker-term-timeout: 5000
hooks-worker-term-retry: 500
hooks-worker-handler-host: localhost
hooks-worker-handler-port: 61321
blueprint: docs/api.apib
endpoint: "http://service:3000"
```

Makefile

```Makefile
.PHONY: stop start clean
.IGNORE: stop start clean

PWD := `pwd`

start:
  docker-compose up -d
  docker-compose restart service

stop:
  docker-compose stop postgres
  docker-compose rm -f postgres

clean:
  docker-compose stop
  docker-compose rm -f
```

hooks.js
```js
var hooks = require('hooks')
var execSync = require('child_process').execSync

hooks.beforeEach(function (transaction, done) {
  // Stop the database container and remove volume to reset dataset
  // to intial state.  When restarting the containers, there is a
  // brief period where database connection cannot be made.  Sleeping
  // for 2 seconds solves problem.
  execSync('make stop')
  execSync('make start')
  execSync('sleep 2')
  done()
})

hooks.afterAll(function (transactions, done) {
  execSync('make clean')
  done()
})
```
