#!/bin/bash

source functions.sh

sudo /opt/dreamfactory-1.9.1-1/ctlscript.sh stop
c

sudo tar -czvf  dreamfactory-1.9.1-1.tar.gz /opt/dreamfactory-1.9.1-1
c

sudo /opt/dreamfactory-1.9.1-1/ctlscript.sh start
c


