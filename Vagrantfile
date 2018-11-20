required_plugins = ["vagrant-hostsupdater", "vagrant-berkshelf"]
required_plugins.each do |plugin|
  unless Vagrant.has_plugin?(plugin)
    # User vagrant plugin manager to install plugin, which will automatically refresh plugin list afterwards
    puts "Installing vagrant plugin #{plugin}"
    Vagrant::Plugin::Manager.instance.install_plugin plugin
    puts "Installed vagrant plugin #{plugin}"
  end
end

Vagrant.configure("2") do |config|

  config.vm.define "kibana" do |kib|
    kib.vm.box = "ubuntu/xenial64"
    kib.vm.network "private_network", ip: "192.168.10.45"
    kib.hostsupdater.aliases = ["development.local"]

    kib.vm.provision "chef_solo" do |chef|
        chef.add_recipe "kibana::default"
        chef.add_recipe "nginx-cookbook::default"
    end
  end

  config.vm.define "elasticsearch" do |ela|
    ela.vm.box = "ubuntu/xenial64"
    ela.vm.network "private_network", ip: "192.168.10.35"
    ela.hostsupdater.aliases = ["ela.local"]

    ela.vm.provision "chef_solo" do |chef|
        chef.add_recipe "elasticsearch::default"
    end
  end

end
