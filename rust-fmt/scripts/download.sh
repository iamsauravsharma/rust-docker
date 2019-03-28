#!/usr/bin/env bash

rustup component add rustfmt
STATUS_CODE=$?
if [[ "$STATUS_CODE" = "0" ]]
then
    echo "export RUSTFMT=\"yes\"" >> ~/.statuscode
else
    echo "export RUSTFMT=\"no\"" >> ~/.statuscode
fi