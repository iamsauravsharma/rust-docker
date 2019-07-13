ARG OS=ubuntu
ARG OS_VERSION=latest
ARG IMAGE=iamsauravsharma/${OS}:${OS_VERSION}

FROM ${IMAGE}

LABEL maintainer="Saurav Sharma <appdroiddeveloper@gmail.com>"

RUN curl https://sh.rustup.rs -sSf | sh -s -- -y --default-toolchain none

ENV PATH /root/.cargo/bin:$PATH

ENTRYPOINT uname -a \
    && rustup --version \
    && /bin/bash