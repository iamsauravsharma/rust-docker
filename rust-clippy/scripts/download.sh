#!/usr/bin/env bash

. ~/.cargo/env
rustup component add clippy
CLIPPY_STATUS_CODE=$? >> ~/.bashrc