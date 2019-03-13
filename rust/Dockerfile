ARG OS=ubuntu
ARG OS_VERSION=latest
ARG IMAGE=iamsauravsharma/rustup:${OS}-${OS_VERSION}

FROM ${IMAGE}

ARG RUST_VERSION=stable

ARG BUILD_DATE
ARG VCS_URL
ARG VCS_REF
ARG VERSION

LABEL maintainer="Saurav Sharma <appdroiddeveloper@gmail.com>"
LABEL org.label-schema.schema-version="1.0"
LABEL org.label-schema.description="Rust image installed in different linux distro"
LABEL org.label-schema.name="rust"
LABEL org.label-schema.build-date=${BUILD_DATE}
LABEL org.label-schema.vcs-url=${VCS_URL}
LABEL org.label-schema.vcs-ref=${VCS_REF}
LABEL org.label-schema.version=${VERSION}

ADD ./scripts /root/scripts/rust-scripts

RUN chmod 777 -R /root/scripts

RUN /root/scripts/rust-scripts/download.sh ${RUST_VERSION}

ENTRYPOINT /root/scripts/rust-scripts/show_version.sh