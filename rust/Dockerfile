ARG OS=ubuntu
ARG OS_VERSION=latest
ARG IMAGE=iamsauravsharma/rustup:${OS}-${OS_VERSION}

FROM ${IMAGE}

ARG RUST_VERSION=stable

ADD ./scripts /root/scripts/rust-scripts

RUN chmod 777 -R /root/scripts

RUN /root/scripts/rust-scripts/download.sh ${RUST_VERSION}

ENTRYPOINT /root/scripts/rust-scripts/show_version.sh