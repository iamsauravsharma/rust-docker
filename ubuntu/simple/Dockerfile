ARG VERSION=latest
ARG IMAGE=ubuntu:${VERSION}

FROM ${IMAGE}

LABEL maintainer="Saurav Sharma <appdroiddeveloper@gmail.com>"

ADD ./scripts /root/ubuntu-scripts

RUN . /root/ubutnu-scripts/update_package.sh

ENTRYPOINT . /root/ubuntu-scripts/show_version.sh