Vagrant.configure("2") do |config|
  config.vm.box = "ubuntu/jammy64"

  if Vagrant.has_plugin?("vagrant-vbguest")
    config.vbguest.auto_update = false
  end

  config.vm.hostname = "sonarqube"
  config.vm.network "forwarded_port", guest: 9000, host: 9000
  config.vm.network "private_network", ip: "192.168.56.11"

  config.vm.provision "shell", path: "./scripts/provision.sh"

  config.vm.provider "virtualbox" do |provider|
    provider.memory=4096
    provider.cpus=2
    provider.customize ["modifyvm", :id, "--audio", "none"]   
    provider.customize ["modifyvm", :id, "--vram", "1"]     
  end
end
