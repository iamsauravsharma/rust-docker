#!/usr/bin/env bash

uname -a
rustup --version
rustc --version
cargo --version
source ~/.statuscode
if [[ "$CLIPPY_STATUS_CODE" == "0" ]]
then
    cargo clippy --version
else
    echo "clippy unavailable to download so clippy is not installed"
fi
/bin/bash