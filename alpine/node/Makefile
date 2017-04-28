.PHONY: all

NODE_LATEST ?= '7.7.3'
NPM_VERSION ?= '4.1.2'

node-base-latest: node-base

node-npm-latest: node-npm

node-base:
	docker build --build-arg 'VERSION=v$(NODE_VERSION)' --build-arg 'NPM_VERSION=$(NPM_VERSION)' -t nowait/node:$(NODE_VERSION)-base-alpine

node-npm:
	docker build --build-arg 'VERSION=v$(NODE_VERSION)' --build-arg 'NPM_VERSION=$(NPM_VERSION)' -t nowait/node:$(NODE_VERSION)-npm-alpine
