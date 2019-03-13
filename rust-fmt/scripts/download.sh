#!/usr/bin/env bash

rustup component add rustfmt
RUSTFMT_STATUS_CODE=$? >> ~/.statuscode