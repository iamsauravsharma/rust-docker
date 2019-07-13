ARG VERSION=latest
ARG IMAGE=ubuntu:${VERSION}

FROM ${IMAGE}

LABEL maintainer="Saurav Sharma <appdroiddeveloper@gmail.com>"

RUN apt update \
    && apt dist-upgrade -y \
    && apt install -y curl sudo git ca-certificates --no-install-recommends \
    && apt autoremove -y \
    && apt clean -y \
    && rm -rf /var/lib/apt/lists/* \
    && rm -rf /tmp/* /var/tmp/* 

ENTRYPOINT ["uname -a","/bin/bash"]