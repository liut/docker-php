NAMESPACE ?= fhyx
IMAGE_NAME ?= php
IMAGE_TAG ?= 7.2

help:
	@echo "make bundle|fpm"

bundle:
	docker build --rm -t=$(NAMESPACE)/$(IMAGE_NAME):$(IMAGE_TAG)-bundle -f Dockerfile.bundle .
.PHONY: build

fpm:
	docker build --rm -t=$(NAMESPACE)/$(IMAGE_NAME):$(IMAGE_TAG) -f Dockerfile.fpm .
.PHONY: fpm


8.0:
# 	docker pull alpine:3.16
	docker build --no-cache -t $(NAMESPACE)/$(IMAGE_NAME):8.0 -f php80.Dockerfile .

8.0-tag:
	$(eval VER=$(shell docker run --rm $(NAMESPACE)/$(IMAGE_NAME):8.0 php -v | head -1 | awk '{print substr($$2,1)}'))
	echo "re tag to $(NAMESPACE)/$(IMAGE_NAME):$(VER)"
	docker tag $(NAMESPACE)/$(IMAGE_NAME):8.0 $(NAMESPACE)/$(IMAGE_NAME):$(VER)
