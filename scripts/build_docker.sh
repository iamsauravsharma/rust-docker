#!/usr/bin/env bash
set -ex

# Different type of OS supported
OS="ALPINE UBUNTU"

# shellcheck disable=SC2034
# Version of different OS support
UBUNTU="latest rolling"

# shellcheck disable=SC2034
ALPINE="latest edge"

# RUST version
RUST="stable beta nightly"

build_image() {
    docker build --build-arg OS="$os_name" --build-arg OS_VERSION="$os_version" --build-arg RUST_VERSION="$rust_version" \
    -t iamsauravsharma/"$1":"$RUST_VERSION" \
    ./"$1"
}

build_clippy_image() {
    build_image rust-clippy
}

build_fmt_image() {
    build_image rust-fmt
}

build_fmt_clippy_image() {
    build_image rust-fmt-clippy
}

tag_stable() {
    docker tag iamsauravsharma/rustup:"$os_name-$os_version" iamsauravsharma/rustup:"$1"
    docker tag iamsauravsharma/rust:stable-"$os_name$os_version" iamsauravsharma/rust:"$1"
    docker tag iamsauravsharma/rust-clippy:stable-"$os_name$os_version" iamsauravsharma/rust-clippy:"$1"
    docker tag iamsauravsharma/rust-fmt:stable-"$os_name$os_version" iamsauravsharma/rust-fmt:"$1"
    docker tag iamsauravsharma/rust-fmt-clippy:stable-"$os_name$os_version" iamsauravsharma/rust-fmt-clippy:"$1"
}

tag_version() {
    docker tag iamsauravsharma/rust:"$rust_version-$os_name$os_version" iamsauravsharma/rust:"$1"
    docker tag iamsauravsharma/rust-clippy:"$rust_version-$os_name$os_version" iamsauravsharma/rust-clippy:"$1"
    docker tag iamsauravsharma/rust-fmt:"$rust_version-$os_name$os_version" iamsauravsharma/rust-fmt:"$1"
    docker tag iamsauravsharma/rust-fmt-clippy:"$rust_version-$os_name$os_version" iamsauravsharma/rust-fmt-clippy:"$1"
}

for os in $OS
do
    version=${!os}
    for os_version in $version
    do
        # lowercase os name so docker images can be built
        os_name="${os,,}"

        # build different os version images for os
        docker build --build-arg VERSION="$os_version" \
        -t iamsauravsharma/"$os_name:$os_version" \
        ./"$os_name"

        # build rustup for that os version
        docker build --build-arg OS="$os_name" --build-arg OS_VERSION="$os_version" \
        -t iamsauravsharma/rustup:"$os_name-$os_version" \
        ./rustup

        # build different version of rust with components for certain os version
        for rust_version in $RUST
        do
            RUST_VERSION=$rust_version-$os_name$os_version

            # build only rust toolchain version installed docker
            build_image rust

            # build docker with clippy pre-installed
            build_clippy_image

            # build docker with rustfmt pre-installed
            build_fmt_image

            # build docker with both clippy and rustfmt pre-installed
            build_fmt_clippy_image
        done

        # tag a images a latest for easy fetching
        if [[ $os_name == "alpine" ]] && [[ $os_version == "latest" ]]
        then
            tag_stable "$os_version"
        fi

        # tag a images by os name for latest
        if [[ $os_version == "latest" ]]
        then
            tag_stable "$os_name"
        fi

        # tag a images of rust as stable, beta, nightly for easy fetching of required version
        if [[ $os_name == "alpine" ]] && [[ $os_version == "latest" ]]
        then
            for rust_version in $RUST
            do
                tag_version "$rust_version"
            done 
        fi

        # tag a image as $rust_version-$os_name for easy fetching of require os latest version
        if [[ $os_version == "latest" ]]
        then
            for rust_version in $RUST
            do
                tag_version "$rust_version-$os_name"
            done
        fi

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

set +x