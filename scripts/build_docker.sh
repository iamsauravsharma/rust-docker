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

        # build different version of rust with components for certain os version
        for rust_version in $RUST
        do

            # build only rust toolchain version installed docker
            docker build --build-arg OS=$os_name --build-arg OS_VERSION=$os_version --build-arg RUST_VERSION=$rust_version \
            -t iamsauravsharma/rust:$rust_version-$os_name$os_version \
            ./rust

            # build docker with clippy installed along with rust
            docker build --build-arg OS=$os_name --build-arg OS_VERSION=$os_version --build-arg RUST_VERSION=$rust_version \
            -t iamsauravsharma/rust-clippy:$rust_version-$os_name$os_version \
            ./rust-clippy

            # build docker with rustfmt installed along with rust
            docker build --build-arg OS=$os_name --build-arg OS_VERSION=$os_version --build-arg RUST_VERSION=$rust_version \
            -t iamsauravsharma/rust-fmt:$rust_version-$os_name$os_version \
            ./rust-fmt

            # build docker with both clippy and rustfmt installed along with rust
            docker build --build-arg OS=$os_name --build-arg OS_VERSION=$os_version --build-arg RUST_VERSION=$rust_version \
            -t iamsauravsharma/rust-fmt-clippy:$rust_version-$os_name$os_version \
            ./rust-fmt-clippy
        done
    done
done