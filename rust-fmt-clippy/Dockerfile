ARG OS=ubuntu
ARG OS_VERSION=latest
ARG RUST_VERSION=stable
ARG IMAGE=iamsauravsharma/rust:${RUST_VERSION}-${OS}${OS_VERSION}

FROM ${IMAGE}

ARG BUILD_DATE
ARG VCS_URL
ARG VCS_REF
ARG VERSION

LABEL maintainer="Saurav Sharma <appdroiddeveloper@gmail.com>"
LABEL org.label-schema.schema-version="1.0"
LABEL org.label-schema.description="Rust along with fmt and clippy preinstalled"
LABEL org.label-schema.name="rust-fmt-clippy"
LABEL org.label-schema.build-date=${BUILD_DATE}
LABEL org.label-schema.vcs-url=${VCS_URL}
LABEL org.label-schema.vcs-ref=${VCS_REF}
LABEL org.label-schema.version=${VERSION}

ADD ./scripts /root/scripts/rust-fmt-clippy-scripts

RUN chmod 777 -R /root/scripts

RUN /root/scripts/rust-fmt-clippy-scripts/download.sh

ENTRYPOINT /root/scripts/rust-fmt-clippy-scripts/show_version.sh