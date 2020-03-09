ARG OS=ubuntu
ARG OS_VERSION=latest
ARG IMAGE=iamsauravsharma/${OS}:${OS_VERSION}

FROM ${IMAGE}

LABEL maintainer="Saurav Sharma <appdroiddeveloper@gmail.com>"

# Download rustup with no default toolchain installed
RUN curl https://sh.rustup.rs -sSf | sh -s -- -y --default-toolchain none --profile minimal

ENV PATH /root/.cargo/bin:$PATH

ENTRYPOINT uname -a \
    && rustup --version \
    && /bin/sh
