ARG OS=ubuntu
ARG OS_VERSION=latest
ARG RUST_VERSION=stable
ARG IMAGE=iamsauravsharma/rust:${RUST_VERSION}-${OS}${OS_VERSION}

FROM ${IMAGE}

RUN . ~/.cargo/env \
    &&rustup compenent add clippy

ENTRYPOINT uname -a \
    && . ~/.cargo/env \
    && rustup --version \
    && rustc --version \
    && cargo --version \
    && cargo clippy --version \
    && /bin/bash