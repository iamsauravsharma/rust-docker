ARG OS=ubuntu
ARG OS_VERSION=latest
ARG IMAGE=iamsauravsharma/rustup:${OS}-${OS_VERSION}

FROM ${IMAGE}

ARG RUST_VERSION=stable

RUN rustup toolchain install ${RUST_VERSION} --component rust-docs \
    && rustup default ${RUST_VERSION}

ENTRYPOINT uname -a \
    && rustup --version \
    && rustc --version \
    && cargo --version \
    && /bin/sh
