VERSION=$(shell cat Dockerfile.version | grep "^FROM " | sed -e "s/FROM.*:v\{0,\}//g" )

NAME ?= operator
TAG ?= $(VERSION)

BASE_DISTRIBUTION ?= default
ENVOY_VERSION ?= none
ifeq ($(BASE_DISTRIBUTION),distroless)
	TAG := $(TAG)-distroless
endif

ifeq ($(NAME),proxyv2)
	ENVOY_VERSION := $(shell docker inspect $(shell docker create istio/proxyv2:$(VERSION)) --format "{{ json .Config.Env }}" | sed -e 's/.*"ISTIO_META_ISTIO_PROXY_SHA=\([^"]*\)".*/\1/g')
endif

split = %0A

prepare:
	@echo ::set-output name=image::$(NAME):$(TAG)
	@echo ::set-output name=build_args::VERSION=$(VERSION)$(split)BASE_DISTRIBUTION=$(BASE_DISTRIBUTION)$(split)ENVOY_VERSION=$(ENVOY_VERSION)