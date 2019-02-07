ARG OS=ubuntu
ARG OS_VERSION=latest
ARG IMAGE=iamsauravsharma/${OS}:${OS_VERSION}

FROM ${IMAGE}

LABEL maintainer="Saurav Sharma <appdroiddeveloper@gmail.com>"

RUN curl https://sh.rustup.rs -sSf | sh -s -- -y --default-toolchain none

ENTRYPOINT uname -a \
    && . ~/.cargo/env \
    && rustup --version \
    && /bin/bash