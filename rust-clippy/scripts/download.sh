#!/usr/bin/env bash

rustup component add clippy
STATUS_CODE=$?
echo "export CLIPPY_STATUS_CODE=\"$STATUS_CODE\"" >> ~/.statuscode