#PATH := $(shell env PATH)
#PWD := $(shell pwd)
#HOME := $(HOME)
PATH_BIN := "$(HOME)/bin"

# See release target
DIST_DIR=dist

# Update channel. Can be release, beta or edge. Uses edge by default.
CHANNEL ?= edge

# Version properties
COMMIT=$(shell git rev-parse --short HEAD)
TAG_NAME=$(shell git describe --abbrev=0)
RELEASE_VERSION=$(TAG_NAME)
SNAPSHOT_VERSION=$(RELEASE_VERSION)-SNAPSHOT-$(COMMIT)

# Set proper version
VERSION=
ifeq ($(TAG_NAME),$(shell git describe --abbrev=4))
	ifeq ($(CHANNEL),edge)
		VERSION=$(SNAPSHOT_VERSION)
	else
		VERSION=$(RELEASE_VERSION)
	endif
else
	VERSION=$(SNAPSHOT_VERSION)
endif


.PHONY: all build lint clean release

all: init

init:
	@echo 'init';
	@echo $(HOME_BIN)
	#echo $(PWD)

git:
	@echo $(COMMIT);
	@echo $(TAG_NAME);
	@echo $(RELEASE_VERSION);
	@echo $(SNAPSHOT_VERSION);
	@echo $(VERSION);

build:
	@echo 123;

lint:
	echo 456;

clean:
	echo 'clean';

release:
	echo 'release';

#make-bin-other:
#	rm -f "${HOME}/bin-other"
#	ln -sf "${CWD}/bin-other" "${HOME}/bin-other"
#	chmod -R 755 "${HOME}/bin-other"



# SHELL = /bin/bash
# DOCKER_HUB_REPO := zshusers/zsh
# DOCKER_HUB_TAG ?= $${VERSION\#zsh-}
# VERSION_LATEST ?= unknown

# require-%:
# 	@: $(if $(${*}),,$(error $* variable must be set))

# build: require-DOCKER_HUB_REPO require-DOCKER_HUB_TAG require-VERSION require-VERSION_LATEST
# 	[[ "${VERSION}" == "${VERSION_LATEST}" ]] && \
# 	docker build --tag $(DOCKER_HUB_REPO):$(DOCKER_HUB_TAG) --tag $(DOCKER_HUB_REPO):latest --build-arg ref=$(VERSION) . || \
# 	docker build --tag $(DOCKER_HUB_REPO):$(DOCKER_HUB_TAG) --build-arg ref=$(VERSION) .

# deploy: require-DOCKER_HUB_REPO require-DOCKER_HUB_TAG require-DOCKER_HUB_USER require-DOCKER_HUB_PASS require-VERSION require-VERSION_LATEST
# 	echo "$(DOCKER_HUB_PASS)" | docker login -u $(DOCKER_HUB_USER) --password-stdin
# 	docker push $(DOCKER_HUB_REPO):$(DOCKER_HUB_TAG)
# 	[[ "${VERSION}" == "${VERSION_LATEST}" ]] && docker push $(DOCKER_HUB_REPO):latest || true

log-stream:
	log stream --process logger --level debug --style syslog

.PHONY: shellcheck
shellcheck: ## run shellcheck validation
	shellcheck  --check-sourced $(PWD)/bin/*
