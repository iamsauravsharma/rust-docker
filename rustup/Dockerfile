ARG OS=ubuntu
ARG OS_VERSION=latest
ARG IMAGE=iamsauravsharma/${OS}:${OS_VERSION}

FROM ${IMAGE}

ARG BUILD_DATE
ARG VCS_URL
ARG VCS_REF
ARG VERSION

LABEL maintainer="Saurav Sharma <appdroiddeveloper@gmail.com>"
LABEL org.label-schema.schema-version="1.0"
LABEL org.label-schema.description="rustup image installed over linux image"
LABEL org.label-schema.name="rustup"
LABEL org.label-schema.build-date=${BUILD_DATE}
LABEL org.label-schema.vcs-url=${VCS_URL}
LABEL org.label-schema.vcs-ref=${VCS_REF}
LABEL org.label-schema.version=${VERSION}

ADD ./scripts /root/scripts/rustup-scripts

RUN chmod 777 -R /root/scripts

RUN /root/scripts/rustup-scripts/download.sh

ENV PATH /root/.cargo/bin:$PATH

ENTRYPOINT /root/scripts/rustup-scripts/show_version.sh