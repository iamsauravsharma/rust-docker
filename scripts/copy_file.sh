#!/usr/bin/env bash

FOLDER="rust rust-clippy rust-fmt rust-fmt-clippy rustup ubuntu"

for folder in $FOLDER
do
    cp -R $folder/scripts/ $folder/simple/scripts/
done