#!/usr/bin/env bash
set -e

#login to docker hub registry in travis or github actions using personal access token
if [[ $TRAVIS == "true" ]] || [[ $GITHUB_ACTIONS  == "true" ]]
then
    echo "$DOCKER_TOKEN" | docker login -u "$DOCKER_USERNAME" --password-stdin
fi

# get repository name along with its tag which contain iamsauravsharma
REPOSITORY_WITH_TAG=$(docker images --filter=reference="iamsauravsharma/*:*" --format "{{.Repository}}:{{.Tag}}")

#push tag to dockerhub registry
for repository in $REPOSITORY_WITH_TAG
do
 docker push "$repository"
done