# Add Elasticsearch node to a cluster
Vagrant file and shell scripts to setup Elasticsearch cluster

You have to have SSH access to the machine(s) to install Elasticsearch.


If you don't have one(s) follow the steps below to setup a virtul machine on local computer

1. Setup Vagrant 
[https://www.vagrantup.com/](https://www.vagrantup.com/ "https://www.vagrantup.com/")

2. Setup Virtual Box 
[https://www.virtualbox.org/](https://www.virtualbox.org/ "https://www.virtualbox.org/")

3. Clone this repo into some dir (for example V21), change directory to it and run vagrant up: 

        git clone https://github.com/vadim-ivlev/vm-setup.git V21 && cd V21 && vagrant up

4. open SHH to the machine

		vagrant ssh

<br><br>

**On the target computer**
		
From your home directory run: 

        git clone https://github.com/vadim-ivlev/vm-setup.git && cd vm-setup && sudo ./install-elasticsearch.sh
		 

Start Elastic

        sudo /etc/init.d/elasticsearch start



