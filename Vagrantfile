Vagrant.configure("2") do |config|
  config.vm.box = "ubuntu/focal64"
  if Vagrant.has_plugin?("vagrant-vbguest")
    config.vbguest.auto_update = false
  end

  config.vm.define "sonarqube" do |sonarqube|
    sonarqube.vm.hostname = "sonarqube"
    sonarqube.vm.network "forwarded_port", guest: 9000, host: 9000, hostip: '127.0.0.1'  
    sonarqube.vm.provision "shell", path: "./scripts/provision.sh"
    # sonarqube.vm.provision :shell, :inline => "ulimit -n 4048"
    sonarqube.vm.provider "virtualbox" do |provider|
      provider.memory=8192
      provider.cpus = 4
    end
  end
end
