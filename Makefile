.DEFAULT_GOAL := build
BUILDX_BUILDER ?= default

.PHONY: 5.4.231
5.4.231:
	docker buildx build \
		--builder=$(BUILDX_BUILDER) \
		--target=vmlinux-ubuntu5.4.231  \
		--output=5.4.231 \
		-f ./Dockerfile.5.4.231 \
		5.4.231

.PHONY: 6.2.0
6.2.0:
	docker buildx build \
		--builder=$(BUILDX_BUILDER) \
		--target=vmlinux-ubuntu6.2.0  \
		--output=6.2.0 \
		-f ./Dockerfile.6.2.0 \
		6.2.0
