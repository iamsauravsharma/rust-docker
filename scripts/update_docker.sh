#!usr/bin/env bash

bash scripts/create_symlink.sh
bash scripts/build_docker.sh
bash scripts/publish_docker.sh
bash scripts/clean_docker.sh
bash scripts/remove_symlink.sh