#!/usr/bin/env bash

docker rm --force $(docker ps --all --quiet) > /dev/null 2>&1;
docker image prune --all --force > /dev/null 2>&1;
docker network prune --force > /dev/null 2>&1;

echo "Success..."
