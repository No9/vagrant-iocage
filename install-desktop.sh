#!/bin/sh

export ASSUME_ALWAYS_YES=YES

pkg install xorg
pkg install mate-desktop mate slim
pkg install virtualbox-ose-additions
sysrc moused_enable=yes dbus_enable=yes hald_enable=yes slim_enable=yes