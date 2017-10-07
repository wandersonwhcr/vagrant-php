Vagrant.configure("2") do |config|
    config.vm.box      = "debian/contrib-jessie64"
    config.vm.hostname = "php"

    config.vm.provider "virtualbox" do |virtualbox|
        virtualbox.cpus   = 1
        virtualbox.memory = 256
    end

    config.vm.provision "shell" do |shell|
        shell.path = "vagrant/shell/default.sh"
    end

    config.vm.provision "puppet" do |puppet|
        puppet.options          = "--verbose --debug"
        puppet.environment      = "development"
        puppet.environment_path = "vagrant/puppet/environments"
    end
end
