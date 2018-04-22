#!/bin/sh

# install iocage 
git clone --recursive https://github.com/iocage/iocage
cd iocage/py-libzfs
python3.6 setup.py build 
python3.6 setup.py install
cd .. 
pip3.6 install .

sysrc iocage_enable="YES"

# iocage create tag gw -r 11.0-RELEASE
# jexec 1 pkg install nginx 
# jexec 1 echo  
