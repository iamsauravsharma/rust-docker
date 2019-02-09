#!/usr/bin/env bash

apt update
apt install -y curl sudo git
rm -rf /var/lib/apt/lists/*