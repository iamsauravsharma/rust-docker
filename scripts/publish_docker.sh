#!/usr/bin/env bash

#login to docker hub registry in travis
if [[ $TRAVIS == "true" ]]
then
    echo "$DOCKER_PASSWORD" | docker login -u "$DOCKER_USERNAME" --password-stdin
fi

# get repository name along with its tag which contain iamsaurav
REPOSITORY_WITH_TAG=$(docker images --filter=reference="iamsauravsharma/*:*" --format "{{.Repository}}:{{.Tag}}")

for repository in $REPOSITORY_WITH_TAG
do
 docker push $repository
done