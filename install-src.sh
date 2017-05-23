#!/bin/sh

curl http://ftp.freebsd.org/pub/FreeBSD/releases/amd64/11.0-RELEASE/src.txz > src.txz 
tar -C / -xvf src.txz