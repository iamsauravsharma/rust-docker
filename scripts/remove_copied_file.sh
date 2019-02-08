#!/usr/bin/env bash

FOLDER="rust rust-clippy rust-fmt rust-fmt-clippy rustup ubuntu"

for folder in $FOLDER
do
    rm -R $folder/simple/scripts
done