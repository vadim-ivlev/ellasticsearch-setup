#!/bin/bash

source functions.sh

sudo useradd mysql
c
sudo tar --same-owner  -xpzvf  dreamfactory-1.9.1-1.tar.gz -C /
c
sudo /opt/dreamfactory-1.9.1-1/ctlscript.sh start
c

