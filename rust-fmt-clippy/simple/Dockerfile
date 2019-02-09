ARG OS=ubuntu
ARG OS_VERSION=latest
ARG RUST_VERSION=stable
ARG IMAGE=iamsauravsharma/rust:${RUST_VERSION}-${OS}${OS_VERSION}

FROM ${IMAGE}

LABEL maintainer="Saurav Sharma <appdroiddeveloper@gmail.com>"

ADD ./scripts /root/scripts/rust-fmt-clippy-scripts

RUN chmod 777 -R /root/scripts

RUN /root/scripts/rust-fmt-clippy-scripts/download.sh

ENTRYPOINT /root/scripts//rust-fmt-clippy-scripts/show_version.sh