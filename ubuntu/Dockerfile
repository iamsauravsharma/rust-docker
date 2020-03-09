ARG VERSION=latest
ARG IMAGE=ubuntu:${VERSION}

FROM ${IMAGE}

LABEL maintainer="Saurav Sharma <appdroiddeveloper@gmail.com>"

# Installed necessary components for installing rustup and clean of all cache before installing rustup
RUN apt update \
    && apt dist-upgrade -y \
    && apt install -y curl sudo git ca-certificates gcc pkg-config libssl-dev --no-install-recommends \
    && apt autoremove -y \
    && apt clean -y \
    && rm -rf /var/lib/apt/lists/* \
    && rm -rf /tmp/* /var/tmp/* 

CMD uname -a \
    && /bin/sh
