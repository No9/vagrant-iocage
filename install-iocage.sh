#!/bin/sh

# install iocage 
git clone --recursive https://github.com/iocage/iocage
cd iocage
pip-3.6 install click
pip-3.6 install coloredlogs
pip-3.6 install requests
pip-3.6 install texttable
make install
sysrc iocage_enable="YES"

# iocage create tag gw -r 11.0-RELEASE
# jexec 1 pkg install nginx 
# jexec 1 echo  
