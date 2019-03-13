#!/usr/bin/env bash

rustup component add clippy
CLIPPY_STATUS_CODE=$? >> ~/.statuscode