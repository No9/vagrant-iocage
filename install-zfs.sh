#!/bin/sh

# enable ZFS
kldload zfs 
sysrc zfs_enable="YES"
zpool create jail_storage ada1 
