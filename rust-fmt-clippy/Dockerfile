ARG OS=ubuntu
ARG OS_VERSION=latest
ARG RUST_VERSION=stable
ARG IMAGE=iamsauravsharma/rust:${RUST_VERSION}-${OS}${OS_VERSION}

FROM ${IMAGE}

LABEL maintainer="Saurav Sharma <appdroiddeveloper@gmail.com>"

RUN rustup toolchain install ${RUST_VERSION} --allow-downgrade --component clippy rustfmt

ENTRYPOINT uname -a \
    && rustup --version \
    && rustc --version \
    && cargo --version \
    && cargo clippy --version \
    && rustfmt --version \
    && /bin/sh
