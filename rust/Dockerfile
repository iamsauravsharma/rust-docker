ARG OS=ubuntu
ARG OS_VERSION=latest
ARG IMAGE=iamsauravsharma/rustup:${OS}-${OS_VERSION}

FROM ${IMAGE}

ARG RUST_VERSION=stable

RUN . ~/.cargo/env \
    && rustup install ${RUST_VERSION} \
    && rustup default ${RUST_VERSION}

ENTRYPOINT uname -a \
    && . ~/.cargo/env \
    && rustup --version \
    && rustc --version \
    && cargo --version \
    && /bin/bash