#!/usr/bin/env bash

. ~/.cargo/env
rustup component add clippy
echo "CLIPPY_STATUS_CODE=$?" >> ~/.statuscode
rustup component add rustfmt
echo "RUSTFMT_STATUS_CODE=$?" >> ~/.statuscode