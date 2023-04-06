IMAGE_NAME := prefect-orion
IMAGE_TAG := 2.7.10
IMAGE := ${IMAGE_NAME}:${IMAGE_TAG}

.PHONY: docker
docker:
	@echo "building docker image ...";
	docker build --platform linux/arm64 -f Dockerfile -t ${IMAGE} .