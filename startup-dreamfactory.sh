#!/bin/bash

# read
# https://wiki.bitnami.com/Native_Installers_Quick_Start_Guide#How_to_start_automatically_the_Stack_on_Linux.3f

source functions.sh


# How to start automatically the Stack on Linux?
# 
# 1. Copy the installdir/ctlscript.sh file to /etc/init.d . It is advisable to rename this script to something more specific, like “bitnami-dreamfactory”.

sudo cp bitnami-dreamfactory /etc/init.d/bitnami-dreamfactory
c
sudo cat /opt/dreamfactory-1.9.1-1/ctlscript.sh >> /etc/init.d/bitnami-dreamfactory
c


 
# 2. Now add the following lines at the beginning of your bitnami-dreamfactory script, modifying them if you need it.

### BEGIN INIT INFO
# Provides:          scriptname
# Required-Start:    $remote_fs $syslog
# Required-Stop:     $remote_fs $syslog
# Default-Start:     2 3 4 5
# Default-Stop:      0 1 6
# Short-Description: Start daemon at boot time
# Description:       Enable service provided by daemon.
### END INIT INFO

# 3. We will use rc-update.d to add the script to the default runlevels.

sudo update-rc.d -f bitnami-dreamfactory defaults
c

# As you can see, we define the priority (80 for start and 30 for stop) and the runlevels in which the script will be executed. The result of this command will be something like
# 4. Then you have to enable it

sudo update-rc.d -f bitnami-dreamfactory enable
c

# And that’s it, the servers will be loaded at boot time. To revert the changes, just type
# $ sudo update-rc.d -f bitnami-dreamfactory remove

