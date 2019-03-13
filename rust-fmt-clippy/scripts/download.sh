#!/usr/bin/env bash

rustup component add clippy
echo "CLIPPY_STATUS_CODE=$?" >> ~/.statuscode
rustup component add rustfmt
echo "RUSTFMT_STATUS_CODE=$?" >> ~/.statuscode