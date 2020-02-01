# -*- mode: ruby -*-
# vi: set ft=ruby :

Vagrant.configure(2) do |config|

  config.vm.box = "ubuntu/xenial64"

  config.vm.provider "virtualbox" do |vb|
     vb.gui = true
  
     vb.memory = "4096"
  end
  
  config.vm.provision "shell", inline: <<-SHELL

    sudo apt-get install language-pack-en
    sudo locale-gen en_GB.UTF-8

    sudo apt-get update
    sudo apt-get -y upgrade

    sudo apt-get install -y git bsdtar

    sudo apt-get -y install \
        apt-transport-https \
        ca-certificates \
        curl \
        software-properties-common

    cd /usr/local/bin
    wget -nc -O - https://releases.hashicorp.com/consul/1.6.3/consul_1.6.3_linux_amd64.zip | bsdtar -xvf-
    chmod a+x consul
    consul version

    sudo apt-get -y autoremove

  SHELL

  config.vm.provision "Copy user's git config", type:'file', source: '~/.gitconfig', destination: '.gitconfig'

end
