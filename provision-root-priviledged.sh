#!/bin/sh

apt-get install language-pack-en
locale-gen en_GB.UTF-8

apt-get update
apt-get -y upgrade

apt-get install -y git bsdtar

apt-get -y install \
    apt-transport-https \
    ca-certificates \
    curl \
    software-properties-common

curl -fsSL https://download.docker.com/linux/ubuntu/gpg | apt-key add -

add-apt-repository \
    "deb [arch=amd64] https://download.docker.com/linux/ubuntu \
    $(lsb_release -cs) \
    stable"

curl -s https://packages.cloud.google.com/apt/doc/apt-key.gpg | apt-key add -
echo "deb https://apt.kubernetes.io/ kubernetes-xenial main" | tee -a /etc/apt/sources.list.d/kubernetes.list

apt-get update

apt-get -y install kubectl docker-ce docker-compose socat

usermod -aG docker vagrant

cd /usr/local/bin || exit
wget -nc -O - https://releases.hashicorp.com/consul/1.7.3/consul_1.7.3_linux_amd64.zip | bsdtar -xvf-
chmod a+x consul

apt-get -y autoremove
