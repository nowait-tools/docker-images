# Nowait Docker Base Image Repository


This is the docker base image repository for Nowait.  All Nowait
applications should start with one of these images.


The repository is divided by host OS and then by application.
It is laid out as follows:

```
├── alpine
│   ├── base-image
│   │   ├── 3.3
│   │   └── 3.4
│   ├── elasticsearch
│   │   └── 2.x
│   ├── erlang
│   ├── java
│   │   ├── openjdk8
│   │   ├── openjre8
│   │   ├── orajdk8
│   │   └── orajre8
│   ├── jenkins
│   │   ├── 1.642.2
│   │   ├── 1.642.3
│   │   ├── 1.642.4
│   │   └── 1.651.1
│   ├── node
│   │   ├── lts
│   │   └── stable
│   │   │   ├── 5.x
│   │   │   └── 6.x
│   ├── php
│   │   ├── 5.6
│   │   │   ├── apache
│   │   │   └── cli
│   │   └── 7.0
│   │       ├── apache
│   │       └── cli
│   ├── python
│   │   ├── 2.x
│   │   └── 3.x
│   └── rabbitmq
│       └── 3.6.x
└── ubuntu
    ├── base-image
    │   ├── 14.04.4
    │   └── 16.04
    └── php
        ├── 5.5
        │   ├── apache
        │   ├── cli
        │   └── composer
        ├── 5.6
        │   ├── apache
        │   ├── cli
        │   └── composer
        └── 7.0
            ├── apache
            ├── cli
            └── composer
```
