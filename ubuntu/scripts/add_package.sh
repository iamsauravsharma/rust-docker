#!/usr/bin/env bash

apt update
apt dist-upgrade -y
apt install -y curl sudo git --no-install-recommends
apt autoremove -y
apt clean -y
rm -rf /var/lib/apt/lists/*
rm -rf /tmp/* /var/tmp/*