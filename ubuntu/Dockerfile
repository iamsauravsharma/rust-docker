ARG VERSION=latest
ARG IMAGE=ubuntu:${VERSION}

FROM ${IMAGE}

RUN apt update \
    && apt install -y \
    curl \
    sudo \
    git \
    && rm -rf /var/lib/apt/lists/*

ENTRYPOINT uname -a \
    && /bin/bash