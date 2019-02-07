ARG VERSION=latest
ARG IMAGE=ubuntu:${VERSION}

FROM ${IMAGE}

LABEL maintainer="Saurav Sharma <appdroiddeveloper@gmail.com>"

RUN apt update \
    && apt install -y \
    curl \
    sudo \
    git \
    && rm -rf /var/lib/apt/lists/*

ENTRYPOINT uname -a \
    && /bin/bash