ARG OS=ubuntu
ARG OS_VERSION=latest
ARG IMAGE=iamsauravsharma/rustup:${OS}-${OS_VERSION}

FROM ${IMAGE}

ARG RUST_VERSION=stable

LABEL maintainer="Saurav Sharma <appdroiddeveloper@gmail.com>"

ADD ../scripts /root/rust-scripts

RUN . /root/rust-scripts/download.sh ${RUST_VERSION}

ENTRYPOINT . /root/rust-scripts/show_version.sh