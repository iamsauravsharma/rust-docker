ARG OS=ubuntu
ARG OS_VERSION=latest
ARG RUST_VERSION=stable
ARG IMAGE=iamsauravsharma/rust:${RUST_VERSION}-${OS}${OS_VERSION}

FROM ${IMAGE}

LABEL maintainer="Saurav Sharma <appdroiddeveloper@gmail.com>"

ADD ../scripts /root/rust-fmt-scripts

RUN . /root/rust-fmt-scripts/download.sh

ENTRYPOINT . /root/rust-fmt-scripts/show_version.sh 