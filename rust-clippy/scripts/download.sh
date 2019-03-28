#!/usr/bin/env bash

rustup component add clippy
STATUS_CODE=$?
if [[ "$STATUS_CODE" = "0" ]]
then
    echo "export CLIPPY=\"yes\"" >> ~/.statuscode
else
    echo "export CLIPPY=\"no\"" >> ~/.statuscode
fi