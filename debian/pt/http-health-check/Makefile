DOCKER_IMAGE := 'nowait/pt-http-health-check:2.2.15-2'

# TODO: We should probably lock down grigori to the git tag 0.1, for now this is fine, it is not being actively changed.
build:
	docker run -v $$(pwd):/go/bin \
	  -e 'GOPATH=/go'   \
	  -e 'GOOS=linux'   \
	  -e 'GOARCH=amd64' \
	  golang:1.8 \
	    go get github.com/mark-adams/grigori
	docker build -t $(DOCKER_IMAGE) .

push:
	docker push $(DOCKER_IMAGE)
