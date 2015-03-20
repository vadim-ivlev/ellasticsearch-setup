#!/bin/bash

# checks exit code of last command. Lets the user decide what to do next.
function c() {
if [ "$?" -ne  "0" ]; then
  tput setaf 1
  echo -e "\n****************************************************\nATTENTION please:  SOMETHING WENT WRONG HERE  !!!!! \n"
  echo -e "  ENTER - to continue \n  Ctrl+C -to interrupt"
  tput sgr0 
  read  O
fi
}

echo update all 
apt-get -y update
c
#apt-get -y upgrade



echo *******************************************************
echo Midnight Commander vim htop pydf avahi

apt-get -y install mc
c
apt-get -y install vim
c
apt-get -y install htop
c
apt-get -y install pydf
c
apt-get -y install avahi-daemon
c


# echo *******************************************************
# echo components for wmware shared folders
# 
# apt-get -y install gcc
# apt-get -y install binutils
# apt-get -y install make
# apt-get -y install linux-source-3.13.0

