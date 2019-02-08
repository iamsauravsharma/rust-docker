ARG OS=ubuntu
ARG OS_VERSION=latest
ARG IMAGE=iamsauravsharma/${OS}:${OS_VERSION}

FROM ${IMAGE}

LABEL maintainer="Saurav Sharma <appdroiddeveloper@gmail.com>"

ADD ./scripts /root/rustup-scripts

RUN . /root/rustup-scripts/download.sh

ENTRYPOINT . /root/rustup-scripts/show_version.sh