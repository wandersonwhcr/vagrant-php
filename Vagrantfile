Vagrant.configure("2") do |config|
    config.vm.box = "debian/contrib-jessie64"

    config.vm.provision "shell" do |shell|
        shell.path = "vagrant/shell/default.sh"
    end
end
