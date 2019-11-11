# -*- mode: ruby -*-
# vi: set ft=ruby :

Vagrant.configure("2") do |config|

  config.vm.define "k8s-master" do |cfg|
    cfg.vm.box = "bento/ubuntu-18.04"
    cfg.vm.hostname = "k8s-master"

    # cfg.vm.network :private_network, ip: "192.168.38.2", gateway: "192.168.38.1"

    cfg.vm.provision "shell", path: "setup/ub-1804-setup.sh"
    cfg.vm.provision "shell", path: "setup/ub-1804-master.sh"
    cfg.vm.provision "shell", path: "setup/ub-1804-config.sh", privileged: false
    cfg.vm.provision "shell", path: "setup/ub-1804-share.sh", privileged: false

    cfg.vm.provider "vmware_desktop" do |v, override|
      v.gui = false
      v.memory = 2048
      v.cpus = 2
      v.linked_clone = true
    end
  end

  config.vm.define "k8s-worker" do |cfg|
    cfg.vm.box = "bento/ubuntu-18.04"
    cfg.vm.hostname = "k8s-worker"

    # cfg.vm.network :private_network, ip: "192.168.38.3", gateway: "192.168.38.1"

    cfg.vm.provision "shell", path: "setup/ub-1804-setup.sh"
    cfg.vm.provision "shell", path: "setup/ub-1804-join.sh", privileged: false

    cfg.vm.provider "vmware_desktop" do |v, override|
      v.gui = false
      v.memory = 2048
      v.cpus = 2
      v.linked_clone = true
    end
  end

  config.vm.define "k8s-win-worker", autostart: false do |cfg|
    cfg.vm.box = "StefanScherer/windows_2019"
    cfg.vm.hostname = "k8s-win-worker"

    cfg.vm.communicator = "winrm"
    # cfg.vm.network :forwarded_port, guest: 5985, host: 5985, id: "winrm", auto_correct: true
    # cfg.vm.network :forwarded_port, guest: 22, host: 2222, id: "ssh", auto_correct: true
    # cfg.vm.network :forwarded_port, guest: 3389, host: 3389, id: "rdp", auto_correct: true
    # cfg.vm.network :private_network, ip: "192.168.38.4", gateway: "192.168.38.1"

    cfg.vm.provision "shell", path: "setup/win-2019-setup.ps1"
    cfg.vm.provision "reload"
    cfg.vm.provision "shell", path: "setup/win-2019-worker.ps1", privileged: false, args: "172.16.208.148"


    cfg.vm.provider "vmware_desktop" do |v, override|
      v.gui = true
      v.memory = 2048
      v.cpus = 2
      v.linked_clone = true
    end
  end
end
