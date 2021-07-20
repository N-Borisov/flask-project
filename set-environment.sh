#!/bin/bash

# Get ip addr and save it in variable
ips=`ip route get 8.8.8.8 | sed -n '/src/{s/.*src *\([^ ]*\).*/\1/p;q}'` && export ips

# install ansible
yum install -y python3 python3-pip && \
curl https://bootstrap.pypa.io/get-pip.py -o get-pip.py && python3 get-pip.py
pip3 install cryptography && \
pip3 install ansible

# follow folder structure
project_dir=`pwd`
export project_dir


# replace ip for prometheus monitoring
sed -i "s/localhost:9323/$ips:9323/" $project_dir/prometheus.yml
sed -i "s/localhost:9104/$ips:9104/" $project_dir/prometheus.yml
sed -i "s/localhost:9323/$ips:9323/" $project_dir/daemon.json

ansible-playbook setup-docker.yml
