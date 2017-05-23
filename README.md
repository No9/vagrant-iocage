# vagrant-iocage

A vagrant script install and configure iocage.

### pre-reqs 

[vagrant](https://www.vagrantup.com/docs/installation/) - installed on a host machine

### usage 
```
> git clone https://github.com/No9/vagrant-iocage.git
> cd vagrant-iocage
> vagrant up
> vagrant ssh
> iocage create -c tag=myjail ip4_addr="em0|10.0.2.16/24" -r 11.0-RELEASE
> ping 10.0.2.16
> iocage console myjail
```

See the iocage documentation for more info http://iocage.readthedocs.io/en/latest/index.html 

## configurables

* VM options
You can dedicate more CPUs and RAM by turning on the options at the top of Vagrantfile.
```
  config.vm.provider "virtualbox" do | v |
         v.memory = 8096
         v.cpus = 2
  end
```

##= known issues

The FreeBSD image uses UFS but ZFS is required for iocage
We create a seperate disc for the zfs but mounting a disk is different for different versions of VBox 

See https://github.com/mitchellh/vagrant/issues/8105#issuecomment-266236294 

You may have to replace `IDE Controller` in Vagrantfile with the out put of `showvminfo`
```
> VBoxManage list vms
"c7_host01_1481400784099_26895" {97bec202-de3a-4b06-b790-4aa742671dd0}
> VBoxManage showvminfo 97bec202-de3a-4b06-b790-4aa742671dd0 | grep 'Storage Controller Name'
Storage Controller Name (0):            IDE Controller
```
