#!/usr/bin/env bash

~/.cargo/env \
&& rustup component add clippy \
&& rustup component add rustfmt