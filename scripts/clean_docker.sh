#!/usr/bin/env bash

#clean and remove container
docker rm $(docker ps -aq) || echo "no container are present to remove out"

#clean and remove images
docker rmi --force --no-prune $(docker images -q) || echo "no images are present to remove out"