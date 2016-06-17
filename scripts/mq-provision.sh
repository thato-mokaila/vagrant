#!/bin/bash

# Chef Server
# wget https://opscode-omnibus-packages.s3.amazonaws.com/el/6/x86_64/chef-server-11.0.10-1.el6.x86_64.rpm
# rpm -Uvh chef-server-11.0.10-1.el6.x86_64.rpm

echo "# *************************************** #"
echo "# working directory: `pwd`"
echo "# *************************************** #"
echo "# executing user: `whoami`"
echo "# *************************************** #"

if [ ! -d "/var/chef" ]; then

    # lets start install configuration
    yum -y update
    yum -y install gcc ruby-devel rubygems git
    curl -L https://www.opscode.com/chef/install.sh | sudo bash

    cd /var
    mkdir -p /tmp/mq_install/scripts
    ## check out cookbooks into working directory
    git clone https://github.com/thato-mokaila/chef.git
    chmod -R 755 ./chef && cd ./chef/ 
    
    cp ./mq/config/qm.ini.tmp /tmp/mq_install
    cp ./mq/config/config.mqsc /tmp/mq_install
    
    #echo "/usr/bin/chef-solo -c solo.rb -j node.json" > /root/init.sh
    #chmod +x /root/init.sh
    
    # start chef client and install websphere mq
    /usr/bin/chef-solo -c solo.rb -j mq.json

else
    # system already installed and configures
    # start queue manager
    if type "/opt/mqm/bin/strmqm" > /dev/null; then
        su -c "strmqm LOCALQUEMGR" mqm
    fi
    # display connaection details
    echo "# ******************************************* #" 
    echo "# MQ Connection Details: #" 
    echo "# ******************************************* #" 
    echo "# mq host: `ifconfig eth1 | grep 'inet addr:' | cut -c21-33` #"
    echo "# mq connection channel: SYSTEM.DEF.SVRCONN #"
    echo "# mq connection port: 1414 #"
    echo "# mq queue manager: LOCALQUEMGR #"
    echo "# mq user: root #"
    echo "# mq password: vagrant #"
    echo "# ******************************************* #"
fi
