-include .env
-include .env.local

DIR := $(shell cd "$(dirname "${BASH_SOURCE[0]}")" >/dev/null 2>&1 && pwd)

SHELL_FILES_PATH := \
	$(PWD)/install \
	$(shell find $(PWD)/bin -type f -print)

# $(shell find $(PWD)/profile -type f -print) \

SHELL_FILES := $(shell file $(SHELL_FILES_PATH) | grep 'shell script\|zsh script' | cut -d: -f1 | sort -u  )

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
  	shfmt -w -s $$file; \
	done

# https://github.com/github/super-linter/blob/master/docs/run-linter-locally.md
.PHONY: super-linter
super-linter: ## Run Super-Linter locally; https://github.com/github/super-linter
	docker run --rm \
 	--env RUN_LOCAL=true \
 	--env VALIDATE_ALL_CODEBASE=true \
 	--env FILTER_REGEX_EXCLUDE=".*bin-tools/.* .*functions/.* .*iTerm2/.* .*phpstorm/.* " \
 	--volume $(PWD):/tmp/lint \
 	github/super-linter

.PHONY: shellcheck
shellcheck: ## ShellCheck finds bugs in your shell scripts: https://www.shellcheck.net
	@for file in $(shell file $(shell find $(PWD)/bin -type f -print) | grep 'shell script' | cut -d: -f1 | sort -u ) ; do \
		shellcheck --check-sourced --external-sources $$file; \
	done

.PHONY: permission
permission: ## set chmod +x $SHELL_HOME/*
	chmod +x $SHELL_HOME/*
