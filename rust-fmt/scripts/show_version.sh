#!/usr/bin/env bash

uname -a
rustup --version
rustc --version
cargo --version
source ~/.statuscode
if [[ "$RUSTFMT" == "yes" ]]
then
    rustfmt --version
else
    echo "rustfmt unavailable to download so rustfmt is not installed"
fi
/bin/bash