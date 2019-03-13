#!/usr/bin/env bash

RUST_VERSION=$1

rustup install ${RUST_VERSION}
rustup default ${RUST_VERSION}