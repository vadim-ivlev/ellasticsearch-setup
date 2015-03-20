# Add Elasticsearch node to a cluster
Vagrant file and shell scripts to setup Elasticsearch cluster

You have to have SSH access to the machine(s) to install Elasticsearch.


If you don't have one(s) follow the steps below to setup a virtul machine on local computer

1. Setup Vagrant 
[https://www.vagrantup.com/](https://www.vagrantup.com/ "https://www.vagrantup.com/")

2. Setup Virtual Box 
[https://www.virtualbox.org/](https://www.virtualbox.org/ "https://www.virtualbox.org/")

3. Clone this repo and change directory to it: 

        git clone https://github.com/vadim-ivlev/vm-setup.git && cd vm-setup

4. Run Vagrant

		vagrant up

5. open SHH to the machine

		vagrant ssh

<br><br>

**On the target computer**
		
Clone this repo and change directory to it: 

        git clone https://github.com/vadim-ivlev/vm-setup.git && cd vm-setup
		 
Open `install-elasticsearch.sh` and check cluster.name and ES_HEAP_SIZE. Run 

        sudo ./install-elasticsearch.sh

Start Elastic

        sudo /etc/init.d/elasticsearch start



