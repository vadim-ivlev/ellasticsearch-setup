#!/bin/bash

source functions.sh


green "update all #########################################################" 
apt-get -y update
c
#apt-get -y upgrade



green "#######################################################"
green "Midnight Commander vim htop ctags pydf avahi"

apt-get -y install mc
c
apt-get -y install vim
c
apt-get -y install htop
c
apt-get install exuberant-ctags
c

#apt-get -y install pydf
#c
#apt-get -y install avahi-daemon
#c

green "installing Node.js v0.12"
# Note the new setup script name for Node.js v0.12
curl -sL https://deb.nodesource.com/setup_0.12 | sudo bash -
c
# Then install with:
sudo apt-get install -y nodejs
c

npm install -g coffee-script
c



green "copy vim files"
cp -r home-files/. ~/.
c
chown -R vagrant:vagrant ~/.*
с


# echo #######################################################
# echo components for wmware shared folders
# 
# apt-get -y install gcc
# apt-get -y install binutils
# apt-get -y install make
# apt-get -y install linux-source-3.13.0

