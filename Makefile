DIR := $(shell cd "$(dirname "${BASH_SOURCE[0]}")" >/dev/null 2>&1 && pwd)


#PATH := $(shell env PATH)
#PWD := $(shell pwd)
#HOME := $(HOME)
#PATH_BIN := "$(HOME)/bin"

# See release target
#DIST_DIR=dist

## Update channel. Can be release, beta or edge. Uses edge by default.
#CHANNEL ?= edge
#
## Version properties
#COMMIT=$(shell git rev-parse --short HEAD)
#TAG_NAME=$(shell git describe --abbrev=0)
#RELEASE_VERSION=$(TAG_NAME)
#SNAPSHOT_VERSION=$(RELEASE_VERSION)-SNAPSHOT-$(COMMIT)
#
## Set proper version
#VERSION=
#ifeq ($(TAG_NAME),$(shell git describe --abbrev=4))
#	ifeq ($(CHANNEL),edge)
#		VERSION=$(SNAPSHOT_VERSION)
#	else
#		VERSION=$(RELEASE_VERSION)
#	endif
#else
#	VERSION=$(SNAPSHOT_VERSION)
#endif


#.PHONY: all build lint clean release
#
#all: init
#
#init:
#	@echo 'init';
#	@echo $(HOME_BIN)
#	#echo $(PWD)

#git:
#	@echo $(COMMIT);
#	@echo $(TAG_NAME);
#	@echo $(RELEASE_VERSION);
#	@echo $(SNAPSHOT_VERSION);
#	@echo $(VERSION);
#
#build:
#	@echo 123;
#
#lint:
#	echo 456;
#
#clean:
#	echo 'clean';
#
#release:
#	echo 'release';

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

#log-stream:
#	log stream --process logger --level debug --style syslog

#.PHONY: shellcheck
#shellcheck: ## run shellcheck validation
	#shellcheck  --check-sourced $(PWD)/bin/*


SHELL_FILES := \
	$(PWD)/install \
	$(shell find $(PWD)/profile -type f -print) \
	$(shell find $(PWD)/bin -type f -print)

SHELL_FILES := $(shell file $(SHELL_FILES) | grep 'shell script\|zsh script' | cut -d: -f1 | sort -u  )

shellcheck_exclude_code := \
	SC1091

# Self-Documented Makefile see https://marmelab.com/blog/2016/02/29/auto-documented-makefile.html
.DEFAULT_GOAL := help

.PHONY: help
help:
	@awk 'BEGIN {FS = ":.*##"; printf "\nUsage:\n  make \033[36m<target>\033[0m\n"} /^[a-zA-Z0-9_-]+:.*?##/ { printf "  \033[36m%-27s\033[0m %s\n", $$1, $$2 } /^##@/ { printf "\n\033[1m%s\033[0m\n", substr($$0, 5) } ' $(MAKEFILE_LIST)

.PHONY: files
files: ## Project variables
	@for file in $(SHELL_FILES) ; do \
		echo $$file; \
	done

.PHONY: shfmt
shfmt: ## A shell parser, formatter, and interpreter with bash support; https://github.com/mvdan/sh
	for file in $(SHELL_FILES) ; do \
  	shfmt -l -w -s -i 2 -sr -ci -bn -kp $$file; \
	done

.PHONY: shellcheck
shellcheck: ## ShellCheck finds bugs in your shell scripts; https://www.shellcheck.net
	for file in $(SHELL_FILES) ; do \
  	shellcheck --check-sourced --external-sources --source-path=$(PWD)/bin $$file; \
	done

# https://github.com/github/super-linter/blob/master/docs/run-linter-locally.md
.PHONY: super-linter
super-linter: ## Run Super-Linter locally; https://github.com/github/super-linter
	docker run --rm \
 	--env RUN_LOCAL=true \
 	--env VALIDATE_ALL_CODEBASE=true \
 	--env FILTER_REGEX_INCLUDE=".*bin/.* .*profile/.* ./install" \
 	--volume $(PWD):/tmp/lint \
 	github/super-linter
