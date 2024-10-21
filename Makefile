IMAGE_REPO ?= ghcr.io/neuro-inc
IMAGE_NAME ?= stable-diffusion-webui
IMAGE_TAG ?= latest
IMAGE_REF = $(IMAGE_REPO)/$(IMAGE_NAME):$(IMAGE_TAG)

STABLESUDIO_IMAGE_NAME ?= stablestudio
STABLESUDIO_IMAGE_TAG ?= latest
STABLESUDIO_IMAGE_REF = $(IMAGE_REPO)/$(IMAGE_NAME):$(IMAGE_TAG)

.PHONY: build-image
build-image:
	docker build -t $(IMAGE_NAME):latest -f Dockerfile .

.PHONY: build-stablestudio-image
build-stablestudio-image:
	cd stablestudio && docker build -t $(STABLESUDIO_IMAGE_NAME):latest -f Dockerfile .

.PHONY: push-image
push-image:
	docker tag $(IMAGE_NAME):latest $(IMAGE_REF)
	docker push $(IMAGE_REF)

.PHONY: push-stablestudio-image
push-stablestudio-image:
	docker tag $(STABLESUDIO_IMAGE_NAME):latest $(STABLESUDIO_IMAGE_REF)
	docker push $(STABLESUDIO_IMAGE_REF)
