# -*- mode: ruby -*-
# vi: set ft=ruby :

Vagrant.configure("2") do |config|

    # Base box config
    config.vm.box = "pxtw/JenkinsBox"
    # config.vm.box_check_update = true
    # config.vm.box_version = "1.0.0"
    config.vm.hostname = "JenkinsBox-CentOS-7"

    # Networking
    config.vm.network "private_network", ip: "10.0.0.10"
    config.vm.network "forwarded_port", guest: 8080, host: 8080
    # config.vm.network "public_network"

    # Sharing
    config.vm.define "virtualbox" do |virtualbox|
    config.vm.synced_folder "./scripts", "/home/vagrant/scripts",
                            mount_options: ["dmode=777,fmode=777"],
                            create: true
    end

    # SSH communication
    # config.ssh.username = "vagrant"
    # config.ssh.password = "vagrant"
    config.ssh.insert_key = true

    # Provider configuration
    config.vm.provider "virtualbox" do |vb|
    vb.memory = "1024"
    vb.cpus = 2

    # Provision
    config.vm.provision "shell", inline: "systemctl restart network.service && ping 10.0.0.10 -c 4"
    config.vm.provision "shell", inline: "sh ./scripts/helloworld.sh"
    config.vm.provision "shell", inline: "sh ./scripts/jenkins_init.sh"
    end
end