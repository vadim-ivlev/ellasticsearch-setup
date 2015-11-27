#!/bin/bash

source functions.sh

ask_user_name



green "downloading ANACONDA"
cd ~
curl -O https://3230d63b5fc54e62148e-c95ac804525aac4b6dba79b00b39d1d3.ssl.cf1.rackcdn.com/Anaconda-2.3.0-Linux-x86_64.sh
c

# remove previous installation
rm -rf ~/anaconda


green "installing IPYTHON"
bash Anaconda-2.3.0-Linux-x86_64.sh -b
c

export PATH="/home/$USER_NAME/anaconda/bin:$PATH"
c
echo "# added by MY installer">> ~/.bashrc
c
echo "export PATH=\"/home/$USER_NAME/anaconda/bin:$PATH\"">> ~/.bashrc
c

source ~/.bashrc



green "install CoffeScript for magic"
pip install CoffeeScript
c


green "installing JUPYTER"
conda install jupyter
c

green "generating  jupyter_notebook_config.py"
jupyter notebook --generate-config
c


green "allowing access from other IPs to notebook server"
echo "c.NotebookApp.ip = '*'" >> ~/.jupyter/jupyter_notebook_config.py
c


chown -R $USER_NAME:$USER_NAME ~/.*
