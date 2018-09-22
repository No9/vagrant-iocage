# -*- mode: ruby -*-
# vi: set ft=ruby :

# All Vagrant configuration is done below. The "2" in Vagrant.configure
# configures the configuration version (we support older styles for
# backwards compatibility). Please don't change it unless you know what
# you're doing.
Vagrant.configure("2") do |config|
  # The most common configuration options are documented and commented below.
  # For a complete reference, please see the online documentation at
  # https://docs.vagrantup.com.

  # We are patching the OS so give it twice the time before time out  
  # Also note that when running headless windows doesn't priotise this process
  config.vm.boot_timeout = 600

  # Allocate some resources 
  config.vm.provider "virtualbox" do | v |
         v.memory = 16192
         v.cpus = 2
  end
  # Every Vagrant development environment requires a box. You can search for
  # boxes at https://atlas.hashicorp.com/search.
  config.vm.box = "freebsd/FreeBSD-11.2-RELEASE"
  
  # Default to sh 
  config.ssh.shell = "sh"

  # Disable sync as it isn't available in FreeBSD
  config.vm.synced_folder ".", "/vagrant", disabled: true

  # Add a mac as it isn't configured in the base box
  config.vm.base_mac = "080027D14C66"
  
  # Create a disck to configure freebsd with
  config.vm.provider "virtualbox" do | v |
      diskPath = 'jail_storage.vdi'
      absDiskPath = File.expand_path(diskPath)
      if not File.exist?(absDiskPath)
        v.customize "pre-import", ['createhd', '--filename', diskPath, '--size', 1000 * 1024]
        # 'IDE Controller' may be incorrect depending on your version of Virtual Box 
        # See README.md for instrucations on finding the right one.
        v.customize "pre-boot", ['storageattach', :id, '--storagectl', 'IDE Controller', '--port', 1, '--device', 0, '--type', 'hdd', '--medium', diskPath]
        v.gui = true
      end
  end
  config.vm.provision "file", source: ".xinitrc", destination: ".xinitrc"
  config.vm.provision "shell", path: "set-timezone.sh"
  config.vm.provision "shell", path: "install-packages.sh"
  config.vm.provision "shell", path: "install-src.sh" 
  config.vm.provision "shell", path: "install-desktop.sh"
  config.vm.provision "shell", path: "install-zfs.sh"
  config.vm.provision "shell", path: "install-iocage.sh"
  
end
