#!/usr/bin/env bash

rustup component add rustfmt
STATUS_CODE=$?
echo "export RUSTFMT_STATUS_CODE=\"$STATUS_CODE\"" >> ~/.statuscode