#!/bin/bash

source functions.sh

ask_user_name

# check your environment
echo $(test -d /etc/pki/tls/certs)$?
#If the result is "1" than that is missing on your system. Try to solve:

if [ ! -d /etc/pki/tls/certs ] 
then
  yellow "directory /etc/pki/tls/certs is missing."
  yellow "# Create missing directory"
  sudo mkdir -p /etc/pki/tls/certs
  c
fi

yellow "# Link ca-certificates"
sudo ln -s /etc/ssl/certs/ca-certificates.crt /etc/pki/tls/certs/ca-bundle.crt
c


yellow " Removing old installation"
sudo rm -rf ~/.meteor


yellow " Try to install meteor as documented"
curl https://install.meteor.com/ | sh

chown -R $USER_NAME:$USER_NAME ~/.*
с

