#!/bin/sh

export ASSUME_ALWAYS_YES=YES

pkg install virtualbox-ose-additions
pkg install xorg
pkg install kde 
sysrc moused_enable=yes dbus_enable=yes hald_enable=yes kdm4_enable=yes