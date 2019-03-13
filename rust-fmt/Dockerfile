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
LABEL org.label-schema.description="rust image with fmt preinstalled"
LABEL org.label-schema.name="rust-fmt"
LABEL org.label-schema.build-date=${BUILD_DATE}
LABEL org.label-schema.vcs-url=${VCS_URL}
LABEL org.label-schema.vcs-ref=${VCS_REF}
LABEL org.label-schema.version=${VERSION}

ADD ./scripts /root/scripts/rust-fmt-scripts

RUN chmod 777 -R /root/scripts

RUN /root/scripts/rust-fmt-scripts/download.sh

ENTRYPOINT /root/scripts/rust-fmt-scripts/show_version.sh