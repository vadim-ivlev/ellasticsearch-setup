#!/bin/bash

echo update all 
apt-get -y update
apt-get -y upgrade



echo *******************************************************
echo Midnight Commander vim htop pydf avahi

apt-get -y install mc
apt-get -y install vim
apt-get -y install htop
apt-get -y install pydf
apt-get -y install avahi-daemon


# echo *******************************************************
# echo components for wmware shared folders
# 
# apt-get -y install gcc
# apt-get -y install binutils
# apt-get -y install make
# apt-get -y install linux-source-3.13.0

