IMAGE_NAMESPACE ?= lcgc
IMAGE_NAME ?= php
IMAGE_TAG ?= 7.2

help:
	@echo "make bundle|fpm"

bundle:
	docker build --rm -t=$(IMAGE_NAMESPACE)/$(IMAGE_NAME):$(IMAGE_TAG)-bundle -f Dockerfile.bundle .
.PHONY: build

fpm:
	docker build --rm -t=$(IMAGE_NAMESPACE)/$(IMAGE_NAME):$(IMAGE_TAG) -f Dockerfile.fpm .
.PHONY: fpm
