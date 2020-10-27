ARG OS=ubuntu
ARG OS_VERSION=latest
ARG IMAGE=iamsauravsharma/rustup${OS}-${OS_VERSION}

FROM ${IMAGE}

ARG RUST_VERSION=stable

LABEL maintainer="Saurav Sharma <appdroiddeveloper@gmail.com>"

RUN rustup toolchain install ${RUST_VERSION} --component clippy rust-docs \
    && rustup default ${RUST_VERSION}

ENTRYPOINT uname -a \
    && rustup --version \
    && rustc --version \
    && cargo --version \
    && cargo clippy --version \
    && /bin/sh
