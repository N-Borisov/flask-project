#!/bin/bash

# Get ip addr and save it in variable
ips=`ip route get 8.8.8.8 | sed -n '/src/{s/.*src *\([^ ]*\).*/\1/p;q}'` && export ips

# install ansible
yum install -y python3 python3-pip && \
pip3 install cryptography && \
pip3 install ansible

# set folder structure
project_dir="/apps"

mkdir $project_dir && cd /project_dir

# clone repo
git clone https://github.com/N-Borisov/flask-project.git

# replace ip for prometheus monitoring
sed "s/localhost:9323/$ips:9323/" flask-project/prometheus.yml
sed "s/localhost:9104/$ips:9104/" flask-project/prometheus.yml
sed "s/localhost:9323/$ips:9323/" flask-project/daemon.json

ansible-playbook setup-docker.yml
