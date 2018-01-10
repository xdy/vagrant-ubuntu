# -*- mode: ruby -*-
# vi: set ft=ruby :

# All Vagrant configuration is done below. The "2" in Vagrant.configure
# configures the configuration version (we support older styles for
# backwards compatibility). Please don't change it unless you know what
# you're doing.
Vagrant.configure("2") do |config|

  # For a complete reference, please see the online documentation at
  # https://docs.vagrantup.com.

  # Every Vagrant development environment requires a box. You can search for
  # boxes at https://atlas.hashicorp.com/search.

  config.vm.box = "ubuntu/xenial64"

  config.vm.network :forwarded_port, guest: 8080, host: 8080

  config.vm.synced_folder ENV['USERPROFILE'], "/home/host"

  config.vm.provider "virtualbox" do |vb|
    vb.memory = "4096"
  end

  config.ssh.forward_agent = true

  config.vm.provision :shell, path: "bootstrap.sh"

end
