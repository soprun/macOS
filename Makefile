SHELL := /bin/bash

-include .env
-include .env.local

DIR := $(shell cd "$(dirname "${BASH_SOURCE[0]}")" >/dev/null 2>&1 && pwd)

ifeq ($(shell ! test -f "$(DIR)/.env.local" && printf 'yes'),yes)
$(shell touch "$(DIR)/.env.local")
$(info Сreate new empty files .env.local)
endif

# TODO: contivmodel should be removed once its code passes golint and misspell
EXCLUDE_DIRS := config iTerm2 phpstorm
PKG_DIRS := $(filter-out $(EXCLUDE_DIRS),$(subst /,,$(sort $(dir $(wildcard */)))))

VERSION := $(shell scripts/getGitVersion.sh)
BUILD_TAG?=$(shell date +'%Y-%m-%d-%H-%M-%S')-$(shell git rev-parse --short HEAD)

SHELL_FILES_PATH := \
	$(PWD)/install \
	$(shell find $(PWD)/bin -type f -print) \
	$(shell find $(PWD)/scripts -type f -print) \
	$(shell find $(PWD)/profile -type f -print)

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
	@for file in $(SHELL_FILES); do \
  	shfmt -w -s -i 2 -bn -ci -fn $$file; \
	done
	@git-commit --push --no-interactive --message="Commit after reformatting the code using sfmt."

# https://github.com/github/super-linter/blob/master/docs/run-linter-locally.md
.PHONY: super-linter
super-linter: ## Run Super-Linter locally; https://github.com/github/super-linter
	@docker run --rm \
 	--env RUN_LOCAL=true \
 	--env VALIDATE_ALL_CODEBASE=true \
 	--env FILTER_REGEX_EXCLUDE=".*bin-tools/.* .*functions/.* .*iTerm2/.* .*phpstorm/.* " \
 	--volume $(PWD):/tmp/lint \
 	github/super-linter

.PHONY: shellcheck
shellcheck: ## ShellCheck finds bugs in your shell scripts: https://www.shellcheck.net
	@for file in $(SHELL_FILES); do \
		shellcheck --check-sourced --external-sources --format=tty $$file; \
	done

default_permissions := $(shell echo -n "$((666 - $(shell umask)))")

.PHONY: permission
permission: ## set chmod
	@chmod -R +x $(SHELL_HOME)/*

	@for file in $(SHELL_FILES) ; do \
		chmod -R +x $$file; \
	done

# chmod -Rv $(permission_chmod) $(SHELL_HOME)/*

#chmod -R 700 "$(HOME)/.ssh"
#chmod -R 700 "$(HOME)/.gnupg"
# The public key (.pub file) should be 644 (-rw-r--r--).
#chmod 644 "$(HOME)/.ssh/"
# The private key (id_rsa) should be 600 (-rw-------).
#chmod 644 "$(HOME)/.ssh/"

#		@for index in $(SYMLINK_FILES_PATH) ; do \
#				source_file="$${index%%::*}"; \
#				target_file="$${index##*::}"; \
#				! test -f "$${target_file}" && printf "\033[0;33mSkip file \033[0;34m%s\033[0;33m, it doesn't exist!\033[0m\n" "$${target_file}" && continue; \
#				chmod -R 700 "$${target_file}"; \
#				printf "File \033[0;34m%s\033[0m, permission \033[0;34m700\033[0m\n" "$${target_file}"; \
#				ls -l "$${target_file}"; \
#		done

SYMLINK_FILES_PATH := \
	"$(DIR)/.env::$(HOME)/.env,600" \
	"$(DIR)/.env.local::$(HOME)/.env.local," \
	"$(DIR)/profile/.zshrc::$(HOME)/.zshrc," \
	"$(DIR)/profile/.bash_profile::$(HOME)/.bash_profile," \
	"$(DIR)/profile/.bash_aliases::$(HOME)/.bash_aliases," \
	"$(DIR)/config/.gitconfig::$(HOME)/.gitconfig," \
	"$(DIR)/config/.gitignore::$(HOME)/.gitignore," \
	"$(DIR)/config/gpg.conf::$(HOME)/.gnupg/gpg.conf," \
	"$(DIR)/config/gpg-agent.conf::$(HOME)/.gnupg/gpg-agent.conf," \
	"$(DIR)/config/ssh/ssh.conf::$(HOME)/.ssh/config," \
	"$(DIR)/config/ssh/authorized_keys::$(HOME)/.ssh/authorized_keys,600" \
	"$(DIR)/config/ssh/known_hosts::$(HOME)/.ssh/known_hosts,600"

.PHONY: symlink
symlink: ## Create symlink
	@rm -f $(SHELL_HOME)
	@ln -s $(DIR)/bin $(SHELL_HOME); # 1. Create symlink ./bin/* to >>> ~/bin/
	@chmod +x $(SHELL_HOME)/*; # 2. Set: chmod +x ~/bin/...

	@for file in $(SYMLINK_FILES_PATH) ; do \
		source_file="$${file%%::*}"; \
		target_file="$${file##*::}"; \
		declare -i permission_file="$${target_file##*,}"; \
		target_file="$${target_file%%,*}"; \
		test -f "$${target_file}" \
		&& printf "\n\033[0;33mSkip file \033[0;34m%s\033[0;33m, it already exists!\033[0m" "$${target_file}" \
		&& continue; \
		ln -sf "$${source_file}" "$${target_file}"; \
		printf "\nCreate symlink: \033[0;32m%s > \033[0;34m%s\033[0m" "$${source_file}" "$${target_file}"; \
		test -f "$${target_file}" && test "$${permission_file}" -ne 0 \
		&& chmod "$${permission_file}" "$${target_file}" \
		&& printf ", permission: \033[0;34m%s\033[0m" "$${permission_file}"; \
		printf "\n"; \
	done

version:
	$(VERSION)



php_config_files := $(shell find $(PWD)/config/php -type f -print)
#find $(PWD)/bin -type f -print

php-install: ##
	@for file in $(php_config_files) ; do \
		echo $${file}; \
		ln -sf "$${file}" "$(shell php -r "echo PHP_CONFIG_FILE_SCAN_DIR;")/`basename -a $${file}`"; \
		printf "\n"; \
	done
