-include .env

# Bash is required as the shell
SHELL := /bin/bash

PROJECT_NAME := $(shell basename $(PWD))
VERSION := $(shell git describe --tags --abbrev=0)
RELEASE_TAG := $(shell date +%Y%m%d-%H%M%S-%3N)
BUILD_ID := $(shell git rev-parse --short HEAD)
BUILD_DIR := $(shell PWD)

init:
	@bash init.sh

init-debug:
	@bash -x init.sh

#.PHONY: help
#all: help
help: Makefile
	@#echo "Choose a command run in "$(PROJECT_NAME)":"
	@echo "project_name: $(PROJECT_NAME)"
	@echo "version: $(VERSION)"
	@echo "release_tag: $(RELEASE_TAG)"
	@echo "build_id: $(BUILD_ID)"
	@echo "BUILD_DIR: $(BUILD_DIR)"
