#!/bin/bash

docker rm $(docker ps -a -q)
docker-compose down
