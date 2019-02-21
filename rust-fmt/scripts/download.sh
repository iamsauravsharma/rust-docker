#!/usr/bin/env bash

. ~/.cargo/env
rustup component add rustfmt
RUSTFMT_STATUS_CODE=$? >> ~/.statuscode