#!/bin/sh

# enable ZFS
kldload zfs 
echo zfs_enabled=\"YES\" >> /etc/rc.conf
zpool create jail_storage ada1 
