#!/usr/bin/env bash

rustup component add clippy
STATUS_CODE=$?
if [[ "$STATUS_CODE" = "0" ]]
then
    echo "export CLIPPY=\"yes\"" >> ~/.statuscode
else
    echo "export CLIPPY=\"no\"" >> ~/.statuscode
fi
rustup component add rustfmt
STATUS_CODE=$?
if [[ "$STATUS_CODE" = "0" ]]
then
    echo "export RUSTFMT=\"yes\"" >> ~/.statuscode
else
    echo "export RUSTFMT=\"no\"" >> ~/.statuscode
fi