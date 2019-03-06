ARG VERSION=latest
ARG IMAGE=ubuntu:${VERSION}

FROM ${IMAGE}

ARG BUILD_DATE
ARG VCS_URL
ARG VCS_REF
ARG VERSION

LABEL maintainer="Saurav Sharma <appdroiddeveloper@gmail.com>"
LABEL org.label-schema.schema-version = "1.0"
LABEL org.label-schema.description = "Ubuntu image with git, curl and sudo preinstalled"
LABEL org.label-schema.name = "Ubuntu"
LABEL org.label-schema.build-date=${BUILD_DATE}
LABEL org.label-schema.vcs-url = ${VCS_URL}
LABEL org.label-schema.vcs-ref = ${VCS_REF}
LABEL org.label-schema.version = ${VERSION}

ADD ./scripts /root/scripts/ubuntu-scripts

RUN chmod 777 -R /root/scripts

RUN /root/scripts/ubuntu-scripts/add_package.sh

ENTRYPOINT /root/scripts/ubuntu-scripts/show_version.sh