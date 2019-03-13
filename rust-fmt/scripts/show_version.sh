#!/usr/bin/env bash

uname -a
rustup --version
rustc --version
cargo --version
. ~/.statuscode
if [[ "$RUSTFMT_STATUS_CODE" == "0" ]]
then
    rustfmt --version
else
    echo "rustfmt unavailable to download so rustfmt is not installed"
fi
/bin/bash