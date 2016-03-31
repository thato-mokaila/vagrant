# vagrant-ibm-mq

## Installs WebSphere MQ Developer Edition v8.0.0.4

> **Pre-requisites:**

> - You must have  vagrant installed and configured.
> - Make sure you have executed the following vagrant command `$ vagrant plugin install vagrant-vbguest`.
> - You must have git installed and configured on your host machine.
> - Adjust the configuration `config.vm.synced_folder` to suite your need. This property must be mapped to folder on your host that will be shared with your guest. Then you will place your version of mq source installation archive in this folder on your host so that it is accessible from your guest vm. Alternatively you could do the following:
  -  > comment this property in the Vagrantfile
  -  > uncomment line # 136 inside ‘websphere-mq’ recipe (allows the script to download the source from an ibm website)
  -  > comment line # 139 inside ‘websphere-mq’ recipe   

### Checing out vagrant files

These scripts were tested on centos 6.4/6.5/7.0. Make sure you have any of these distros if you are going to use your own Vagrantfile’s. Alternatively if you want to get started right away you can clone existing ones from here [GitHub](https://github.com/thato-mokaila/vagrant)

* /vagrant/provisions.sh
* /vagrant/vagrant-ibm-mq/Vagrantfile


### Using the scripts

The following vagrant commands describes a typical process of using the vm. The script `provision.sh` is used as an entry point, on first execution it updates the system, installs necessary packes that are required for chef-solo to run, including chef-solo itself. On subsequent executions it just starts up websphere mq using option `--provision`.

* `$ vagrant up` (this will execute the provision script, in here we install mq)
* `$ vagrant ssh` (connect to the vm and issue the ‘ifconfig’ to see the vm ip)
* `$ exit` (exits the vm but does not shut it down, this is issued within the vm)
* `$ vagrant halt` (stop the vm and shuts down websphere mq)
* `$ vagrant up` (starts up the vm but not websphere mq)
* `$ vagrant provision` (starts up websphere mq)

### Connection Details

#### Use the following parameters to configure MQ explorer

* Server hostname/ip address: (see vagrant ssh command above)
* Server connection channel: SYSTEM.DEF.SVRCONN
* Server connection port: 1414
* User: root
* User password: vagrant


# vagrant-ibm-db2

## Installs IBM DB2 Express Edition v10.5

...

### License and Authors

Authors: Thato Mokaila thatom@eltengroup.co.za