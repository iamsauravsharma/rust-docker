#!/usr/bin/env bash

#clean and remove container
docker rm $(docker ps -aq) || echo "no container are present to remove out"

#clean and remove images
docker rmi $(docker images --format "{{.Repository}}:{{.Tag}}") || echo "no images are present to remove out"