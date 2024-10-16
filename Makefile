
IMAGE_REPO ?= ghcr.io/neuro-inc
IMAGE_NAME ?= stable-diffusion-webui
IMAGE_TAG ?= latest
IMAGE_REF = $(IMAGE_REPO)/$(IMAGE_NAME):$(IMAGE_TAG)

.PHONY: build-image
build-image:
	docker build -t $(IMAGE_NAME):latest -f Dockerfile .

.PHONY: push-image
push-image:
	docker tag $(IMAGE_NAME):latest $(IMAGE_REF)
	docker push $(IMAGE_REF)
