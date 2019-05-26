#!/usr/bin/env bash

# Different type of OS supported
OS="UBUNTU"

# Version of different OS support
UBUNTU="latest rolling devel"

# RUST version
RUST="stable beta nightly"

for os in $OS
do
    version=${!os}
    for os_version in $version
    do
        # lowercase os name so docker images can be built
        os_name="${os,,}"

        # build different os version images for os
        docker build --build-arg VERSION=$os_version \
        -t iamsauravsharma/$os_name:$os_version \
        ./$os_name

        # build rustup for that os version
        docker build --build-arg OS=$os_name --build-arg OS_VERSION=$os_version \
        -t iamsauravsharma/rustup:$os_name-$os_version \
        ./rustup

        if [[ $os_name = "ubuntu" ]] && [[ $os_version == "latest" ]]
        then
            docker build -t iamsauravsharma/rustup:latest ./rustup
            docker build -t iamsauravsharma/rust:latest ./rust
            docker build -t iamsauravsharma/rust-clippy:latest ./rust-clippy
            docker build -t iamsauravsharma/rust-fmt:latest ./rust-fmt
            docker build -t iamsauravsharma/rust-fmt-clippy:latest ./rust-fmt-clippy
        fi

        # build different version of rust with components for certain os version
        for rust_version in $RUST
        do
            RUST_VERSION=$rust_version-$os_name$os_version

            # build only rust toolchain version installed docker
            docker build --build-arg OS=$os_name --build-arg OS_VERSION=$os_version --build-arg RUST_VERSION=$rust_version \
            -t iamsauravsharma/rust:$RUST_VERSION \
            ./rust

            # build docker with clippy installed along with rust
            docker build --build-arg OS=$os_name --build-arg OS_VERSION=$os_version --build-arg RUST_VERSION=$rust_version \
            -t iamsauravsharma/rust-clippy:$RUST_VERSION \
            ./rust-clippy

            # build docker with rustfmt installed along with rust
            docker build --build-arg OS=$os_name --build-arg OS_VERSION=$os_version --build-arg RUST_VERSION=$rust_version \
            -t iamsauravsharma/rust-fmt:$RUST_VERSION \
            ./rust-fmt

            # build docker with both clippy and rustfmt installed along with rust
            docker build --build-arg OS=$os_name --build-arg OS_VERSION=$os_version --build-arg RUST_VERSION=$rust_version \
            -t iamsauravsharma/rust-fmt-clippy:$RUST_VERSION \
            ./rust-fmt-clippy
        done

        # check if docker script is runnning in travis then check branch and run otherwise locally run without checking branch
        if [[ $TRAVIS == "true" ]]
        then
            if [[ "$TRAVIS_BRANCH" == "master" ]] && [[ "$TRAVIS_PULL_REQUEST" == "false" ]]
            then
                bash scripts/publish_docker.sh
            fi
            bash scripts/clean_docker.sh
        else
            bash scripts/publish_docker.sh
            bash scripts/clean_docker.sh
        fi

    done
done