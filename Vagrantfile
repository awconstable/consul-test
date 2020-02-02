# -*- mode: ruby -*-
# vi: set ft=ruby :

Vagrant.configure(2) do |config|

  config.vm.box = "ubuntu/xenial64"

  config.vm.provider "virtualbox" do |vb|
     vb.gui = true
  
     vb.memory = "4096"
  end
  
  config.vm.provision "shell", privileged: true, inline: <<-SHELL

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

    apt-get -y install kubectl docker-ce docker-compose

    usermod -aG docker vagrant

    cd /usr/local/bin
    wget -nc -O - https://releases.hashicorp.com/consul/1.6.3/consul_1.6.3_linux_amd64.zip | bsdtar -xvf-
    chmod a+x consul

    apt-get -y autoremove

  SHELL

  config.vm.provision "shell", privileged: false, inline: <<-SHELL

    curl https://shipyard.demo.gs/install.sh | bash

    echo export KUBECONFIG="$HOME/.shipyard/yards/shipyard/kubeconfig.yml" >> $HOME/.bashrc

  SHELL

  config.vm.provision "Copy user's git config", type:'file', source: '~/.gitconfig', destination: '.gitconfig'

  config.vm.network "forwarded_port", guest: 8200, host: 8200, host_ip: "0.0.0.0", id: "vault"
  config.vm.network "forwarded_port", guest: 8500, host: 8500, host_ip: "0.0.0.0", id: "consul"
  config.vm.network "forwarded_port", guest: 8443, host: 8443, host_ip: "0.0.0.0", id: "k8s-dashboard"
  config.vm.network "forwarded_port", guest: 8080, host: 8080, host_ip: "0.0.0.0", id: "web"
end
