#!/bin/bash

# Get ip addr and save it in variable
ips=`ip route get 8.8.8.8 | sed -n '/src/{s/.*src *\([^ ]*\).*/\1/p;q}'` && export ips

# install ansible
yum install -y python3 python3-pip && \
pip3 install cryptography && \
pip3 install ansible

mkdir /apps && cd /apps

git clone https://github.com/N-Borisov/flask-project.git
