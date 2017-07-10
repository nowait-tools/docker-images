# Flow docker image
Dockerfile for flow on alpine

## How to update docker image for flow
1. Clone this repo and navigate to this folder
1. Update the Dockerfile (for example, the flow version)
1. Run `docker build -t nowait/docker-flow:<flow-version> .`
1. Push docker image to docker hub `docker push nowait/docker-flow:<flow-version>`