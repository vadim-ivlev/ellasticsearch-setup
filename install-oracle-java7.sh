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
sudo apt-get update -y


#ensure automated install 
echo oracle-java7-installer shared/accepted-oracle-license-v1-1 select true | sudo /usr/bin/debconf-set-selections


#install
sudo apt-get install -y oracle-java7-installer

# show  java version
tput setaf 1
java -version
tput sgr0


# set env variables
sudo apt-get install -y oracle-java7-set-default

