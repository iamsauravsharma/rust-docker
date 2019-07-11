ARG OS=ubuntu
ARG OS_VERSION=latest
ARG IMAGE=${OS}:${OS_VERSION}

FROM ${IMAGE}

LABEL maintainer="Saurav Sharma <appdroiddeveloper@gmail.com>"

ADD ./scripts /root/scripts/rustup-scripts

RUN chmod 777 -R /root/scripts

RUN /root/scripts/rustup-scripts/download.sh

ENV PATH /root/.cargo/bin:$PATH

ENTRYPOINT /root/scripts/rustup-scripts/show_version.sh