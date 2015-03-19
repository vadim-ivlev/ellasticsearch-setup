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


echo **************************************************************
echo **************************************************************
echo Install Oracle Java 7
echo **************************************************************
echo **************************************************************


#update repository information
sudo add-apt-repository -y ppa:webupd8team/java
c
sudo apt-get update -y
c

#ensure automated install 
echo oracle-java7-installer shared/accepted-oracle-license-v1-1 select true | sudo /usr/bin/debconf-set-selections
c



#install
sudo apt-get install -y oracle-java7-installer
c

# show  java version
tput setaf 1
java -version
tput sgr0


# set env variables
sudo apt-get install -y oracle-java7-set-default
c


echo **************************************************************
echo **************************************************************
echo Install Elasticsearch
echo **************************************************************
echo **************************************************************


# Download and install the Public Signing Key
wget -qO - https://packages.elasticsearch.org/GPG-KEY-elasticsearch | sudo apt-key add -
c

# Add the following to your /etc/apt/sources.list to enable the repository
sudo add-apt-repository "deb http://packages.elasticsearch.org/elasticsearch/1.4/debian stable main"
c

#Run apt-get update and the repository is ready for use. You can install it with :
sudo apt-get update && sudo apt-get install elasticsearch
c

#Configure Elasticsearch to automatically start during bootup :
sudo update-rc.d elasticsearch defaults 95 10
c

# Если надо будет убрать автозапуск, делается это командой:
# sudo update-rc.d -f elasticsearch remove


 
