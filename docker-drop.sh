#!/bin/sh

set -e

docker rm --force $(docker ps --all --quiet) > /dev/null 2>&1;
docker image prune --all --force > /dev/null 2>&1;
docker network prune --force > /dev/null 2>&1;

echo "Success..."

#
# if [[ (docker ps --all --quiet | wc -l ) > 1 ]]; then
#   #statements
#
# fi

# docker rm --force $(docker ps --all --quiet);
# docker image prune --all --force;
# docker network prune --force;

# Останавливаем все запущенные контейнеры docker kill $(docker ps -q).
# Удаляем все остановленные контейнеры docker rm $(docker ps -a -q).
# Удаляем все образы docker rmi $(docker images -q)

###############

# Remove all containers that aren't running.
# docker rm -vf $(docker ps -a -q --filter "status=exited")

# Remove untagged images.
# docker rmi -f $(docker images -q -f "dangling=true")

# Remove unused volumes using "rm" or "prune".
# docker volume rm -f $(docker volume ls -f "dangling=true")
# docker volume prune -f

# Remove unused networks.
# docker network prune -f

# https://oracle-base.com/articles/linux/docker-clean-up-unwanted-containers-images-layers-volumes-networks
