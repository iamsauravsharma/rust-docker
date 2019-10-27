ARG VERSION=latest
ARG IMAGE=alpine:${VERSION}

FROM ${IMAGE}

LABEL maintainer="Saurav Sharma <appdroiddeveloper@gmail.com>"

# Installed necessary components for installing rustup and clean of all cache before installing rustup
RUN apk add --update \
    curl \
    sudo \
    git \
    ca-certificates \
    gcc \
    && rm -rf /var/cache/apk/*

CMD uname -a \
    && /bin/bash