ARG VERSION=latest
ARG IMAGE=ubuntu:${VERSION}

FROM ${IMAGE}

LABEL maintainer="Saurav Sharma <appdroiddeveloper@gmail.com>"

ADD ./scripts /root/scripts/ubuntu-scripts

RUN chmod 777 -R /root/scripts

RUN /root/scripts/ubuntu-scripts/add_package.sh

ENTRYPOINT /root/scripts/ubuntu-scripts/show_version.sh