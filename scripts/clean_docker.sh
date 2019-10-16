#!/usr/bin/env bash
set -e

#clean and remove container
docker rm "$(docker ps -aq)" || echo "no container are present to remove out"

#clean and remove images which has format of repository:tag
docker rmi "$(docker images --format "{{.Repository}}:{{.Tag}}")" || echo "no images are present to remove out"