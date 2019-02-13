#!/usr/bin/env bash

apt update
apt dist-upgrade -y
apt install -y curl sudo git
rm -rf /var/lib/apt/lists/*