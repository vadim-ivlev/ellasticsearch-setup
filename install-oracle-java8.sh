#!/bin/bash

source functions.sh


green "##################Install Oracle Java 8 ########################################"


green "#update repository information"
add-apt-repository -y ppa:webupd8team/java
c
apt-get update -y
c

green "#ensure automated install" 
echo oracle-java8-installer shared/accepted-oracle-license-v1-1 select true | sudo /usr/bin/debconf-set-selections
c



green "#install"
apt-get install -y oracle-java8-installer
c

green "# show  java version"
tput setaf 3
java -version
tput sgr0


green "# set env variables"
apt-get install -y oracle-java8-set-default
c

