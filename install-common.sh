#!/bin/bash

source functions.sh


green "update all #########################################################" 
apt-get -y update
c
#apt-get -y upgrade



green "#######################################################"
green "Midnight Commander vim htop pydf avahi"

apt-get -y install mc
c
apt-get -y install vim
c
apt-get -y install htop
c
#apt-get -y install pydf
#c
#apt-get -y install avahi-daemon
#c

green "copy vim files"
cp -r home-files/. ~/.
c

# echo #######################################################
# echo components for wmware shared folders
# 
# apt-get -y install gcc
# apt-get -y install binutils
# apt-get -y install make
# apt-get -y install linux-source-3.13.0

