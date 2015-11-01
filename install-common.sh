#!/bin/bash

source functions.sh

green "ENTER YOUR USER NAME"
read -e -p "Press Enter to confirm: " -i "vagrant" USER_NAME

green "update all #########################################################" 
apt-get -y update
c
apt-get -y upgrade
c


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

green "installing Node.js"
# Note the new setup script name for Node.js v0.12
#curl -sL https://deb.nodesource.com/setup_0.12 | sudo bash -
curl -sL https://deb.nodesource.com/setup_4.x | sudo -E bash -
c


# Then install with:
sudo apt-get install -y nodejs
c

npm install -g coffee-script
c


npm install -g http-server
c


green "copy vim files"
cp -rf home-files/. ~/.
c

green "cloning vim plugins"
git clone https://github.com/kchmck/vim-coffee-script.git ~/.vim/bundle/vim-coffee-script/
c
git clone git://github.com/digitaltoad/vim-jade.git ~/.vim/bundle/vim-jade/
c
git clone https://github.com/groenewege/vim-less ~/.vim/bundle/vim-less/
c
git clone git://github.com/wavded/vim-stylus.git ~/.vim/bundle/vim-stylus/
c
git clone git://github.com/godlygeek/tabular.git ~/.vim/bundle/tabular/
c
git clone git://github.com/jpalardy/vim-slime.git ~/.vim/bundle/vim-slime/
c
git clone git://github.com/jiangmiao/auto-pairs.git ~/.vim/bundle/auto-pairs/
c


green "installing build -essential"
apt-get install -y build-essential checkinstall
c

# echo #######################################################
# echo components for wmware shared folders
# 
# apt-get -y install gcc
# apt-get -y install binutils
# apt-get -y install make
# apt-get -y install linux-source-3.13.0


chown -R $USER_NAME:$USER_NAME ~/.*
с

source install-oracle-java8.sh
source install-ipython.sh

