# nowait cron

This is a fork of (https://github.com/SocialEngine/rancher-cron)
This image supports execution of one or more identical containers.

## Usage

This container needs run with the following labels:
```
rancher-cron:
  labels:
    io.rancher.container.create_agent: 'true'
    io.rancher.container.agent.role: environment
```

__NOTICE:__ At the time of writing Rancher has a bug which causes system labels to **NOT** be copied on upgrades and clones.

On a container/service which should be run via cron add the following label:
```
com.socialengine.rancher-cron.schedule: <execution>
```
See (https://github.com/SocialEngine/rancher-cron) for a list of possible patterns

## Credits

[SocialEngine - rancher-cron](https://github.com/SocialEngine/rancher-cron)
