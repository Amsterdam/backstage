.ONESHELL:

# Defines default variables
APP_NAME ?= backstage
TEAM_NAME ?= amsterdam
REGISTRY ?= localhost:5000
REPOSITORY ?= $(TEAM_NAME)/$(APP_NAME)

UID:=$(shell id --user)
GID:=$(shell id --group)
dc = docker compose
run = $(dc) run --rm -u ${UID}:${GID}

export REGISTRY
export REPOSITORY
export VERSION

test:
	echo test

build:
	$(dc) build

push: build
	$(dc) push

bash:
	$(run) dev bash
