# Add Elasticsearch node to a cluster
shell scripts to setup Elasticsearch cluster

## Install 		
Open SHH to your target machine. In your home directory run: 

        git clone https://github.com/vadim-ivlev/vm-setup.git && cd vm-setup && sudo ./install-elasticsearch.sh
		 
## Check
You can see Status, Start and Stop Elastic by

        sudo /etc/init.d/elasticsearch status
        sudo /etc/init.d/elasticsearch start
        sudo /etc/init.d/elasticsearch stop

<br><br>

---------------------------


### Setting up a virtual machine

If you don't have a virtual machine  follow steps below to setup a virtul machine your local computer

1. Setup Vagrant 
[https://www.vagrantup.com/](https://www.vagrantup.com/ "https://www.vagrantup.com/")

2. Setup Virtual Box 
[https://www.virtualbox.org/](https://www.virtualbox.org/ "https://www.virtualbox.org/")

3. Run the following command to clone this repo into some dir (for example V21) and setup a virtual machine in it: 

        git clone https://github.com/vadim-ivlev/vm-setup.git V21 && cd V21 && vagrant up

4. Open SHH session to the machine

		vagrant ssh






