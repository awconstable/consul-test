# -*- mode: ruby -*-
# vi: set ft=ruby :

Vagrant.configure(2) do |config|

  config.vm.box = "ubuntu/xenial64"

  config.vm.provider "virtualbox" do |vb|
     vb.gui = true
  
     vb.memory = "4096"
  end
  
  config.vm.provision "shell", privileged: true, path: 'provision-root-priviledged.sh'
  config.vm.provision "shell", privileged: false, path: 'provision-user-priviledged.sh'

  config.vm.provision "Copy user's git config", type:'file', source: '~/.gitconfig', destination: '.gitconfig'

  config.vm.network "forwarded_port", guest: 8200, host: 8200, host_ip: "0.0.0.0", id: "vault"
  config.vm.network "forwarded_port", guest: 8500, host: 8500, host_ip: "0.0.0.0", id: "consul"
  config.vm.network "forwarded_port", guest: 8443, host: 8443, host_ip: "0.0.0.0", id: "k8s-dashboard"
  config.vm.network "forwarded_port", guest: 8080, host: 8080, host_ip: "0.0.0.0", id: "web"
end
