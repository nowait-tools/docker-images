# Nowait Docker Base Image Repository


This is the docker base image repository for Nowait.  All Nowait
applications should start with one of these images.


The repository is divided by host OS and then by application.
It is laid out as follows:

```
├── alpine
│   ├── base-image
│   │   └── 3.3
│   ├── java
│   │   ├── openjdk8
│   │   ├── openjre8
│   │   ├── orajdk8
│   │   └── orajre8
│   ├── jenkins
│   │   ├── 1.642.2
│   │   └── 1.642.3
│   └── php
│       ├── 5.6
│       │   └── apache
│       └── 7.0
│           └── apache
└── ubuntu
    ├── base-image
    │   ├── 14.04.4
    │   └── 16.04
    └── php
        ├── 5.5
        │   └── apache
        ├── 5.6
        │   └── apache
        └── 7.0
            └── apache
```
