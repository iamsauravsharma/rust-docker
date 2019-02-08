ARG OS=ubuntu
ARG OS_VERSION=latest
ARG RUST_VERSION=stable
ARG IMAGE=iamsauravsharma/rust:${RUST_VERSION}-${OS}${OS_VERSION}

FROM ${IMAGE}

LABEL maintainer="Saurav Sharma <appdroiddeveloper@gmail.com>"

ADD ../scripts /root/rust-clippy-scripts

RUN . /root/rust-clippy-scripts/download.sh

ENTRYPOINT . /root/rust-clippy-scripts/show_version.sh