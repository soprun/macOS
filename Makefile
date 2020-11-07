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
