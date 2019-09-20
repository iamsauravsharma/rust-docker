#!/usr/bin/env bash

# Different type of OS supported
OS="UBUNTU"

# Version of different OS support
UBUNTU="latest rolling"

# RUST version
RUST="stable beta nightly"

CLIPPY_DATE=$(curl https://rust-lang.github.io/rustup-components-history/x86_64-unknown-linux-gnu/clippy)
RUSTFMT_DATE=$(curl https://rust-lang.github.io/rustup-components-history/x86_64-unknown-linux-gnu/rustfmt)
TODAY_DATE=$(date +%Y-%m-%d)

build_image() {
    docker build --build-arg OS=$os_name --build-arg OS_VERSION=$os_version --build-arg RUST_VERSION=$rust_version \
    -t iamsauravsharma/$1:$RUST_VERSION \
    ./$1
}

build_clippy_image() {
    if [[ $CLIPPY_DATE == $TODAY_DATE ]] || [[ $rust_version != "nightly" ]]
    then
        build_image rust-clippy
    fi
}

build_fmt_image() {
    if [[ $RUSTFMT_DATE == $TODAY_DATE ]] || [[ $rust_version != "nightly" ]]
    then
        build_image rust-fmt
    fi
}

build_fmt_clippy_image() {
    if [[ $RUSTFMT_DATE == $TODAY_DATE && $CLIPPY_DATE == $TODAY_DATE ]] || [[ $rust_version != "nightly" ]]
    then
        build_image rust-fmt-clippy
    fi
}

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
        if [[ $os_name == "ubuntu" ]] && [[ $os_version == "latest" ]]
        then
            docker tag iamsauravsharma/rustup:$os_name-$os_version iamsauravsharma/rustup:latest
            docker tag iamsauravsharma/rust:stable-$os_name$os_version iamsauravsharma/rust:latest
            docker tag iamsauravsharma/rust-clippy:stable-$os_name$os_version iamsauravsharma/rust-clippy:latest
            docker tag iamsauravsharma/rust-fmt:stable-$os_name$os_version iamsauravsharma/rust-fmt:latest
            docker tag iamsauravsharma/rust-fmt-clippy:stable-$os_name$os_version iamsauravsharma/rust-fmt-clippy:latest
        fi

        # tag a images of rust as stable, beta, nightly for easy fetching of required version
        if [[ $os_name == "ubuntu" ]] && [[ $os_version == "latest" ]]
        then
            for rust_version in $RUST
            do
                docker tag iamsauravsharma/rust:$rust_version-$os_name$os_version iamsauravsharma/rust:$rust_version
                if [[ $rust_version != "nightly" ]] || [[ $CLIPPY_DATE == $TODAY_DATE ]]
                then
                    docker tag iamsauravsharma/rust-clippy:$rust_version-$os_name$os_version iamsauravsharma/rust-clippy:$rust_version
                fi
                if [[ $rust_version != "nightly" ]] || [[ $RUSTFMT_DATE == $TODAY_DATE ]]
                then
                    docker tag iamsauravsharma/rust-fmt:$rust_version-$os_name$os_version iamsauravsharma/rust-fmt:$rust_version
                fi
                if [[ $rust_version != "nightly" ]] || [[ $CLIPPY_DATE == $TODAY_DATE && $RUSTFMT_DATE == $TODAY_DATE ]]
                then
                    docker tag iamsauravsharma/rust-fmt-clippy:$rust_version-$os_name$os_version iamsauravsharma/rust-fmt-clippy:$rust_version
                fi
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
