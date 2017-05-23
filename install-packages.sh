#!/bin/sh

export ASSUME_ALWAYS_YES=YES

# Install prereqs
pkg install curl
pkg install git
pkg install git
pkg install python36
pkg install libgit2
python3.6 -m ensurepip
pip3.6 install Cython