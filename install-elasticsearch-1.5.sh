#!/bin/bash

source functions.sh




green "Type Elasticsearch Cluster Name. Should be the same for all nodes."
read -e -p "Enter to confirm: " -i "CLUSTER-0" CLUSTER_NAME

green "Type Node Name. To identify the nodes."
read -e -p "Enter to confirm: " -i "NODE-00"  NODE_NAME

green "Type Elasticsearch Heap size. Recommended value is 1/2 of RAM. From 256m to 31g."
read -e -p "Enter to confirm: " -i "512m" HEAP_SIZE

green "Type minimum master nodes. Recommended value =  1/2 * (num of nodes) + 1"
read -e -p "Enter to confirm: " -i "1" MININUM_MASTER_NODES


green "You entered:"
green "Cluster Name: $CLUSTER_NAME"
green "Node: $NODE_NAME"
green "Heap size: $HEAP_SIZE"
green "Minimum master nodes: $MININUM_MASTER_NODES"

yellow "Press [ENTER] to continue. Ctrl-C to interrupt"
read iii


source install-common.sh
source install-oracle-java8.sh





green "############ Install Elasticsearch 1.5 ########################"


# Download and install the Public Signing Key
wget -qO - https://packages.elasticsearch.org/GPG-KEY-elasticsearch | sudo apt-key add -
c

# Add the repository definition to your /etc/apt/sources.list file
#add-apt-repository "deb http://packages.elasticsearch.org/elasticsearch/1.4/debian stable main"
echo "deb http://packages.elasticsearch.org/elasticsearch/1.5/debian stable main" | sudo tee -a /etc/apt/sources.list
c

#Run apt-get update and the repository is ready for use. You can install it with :
apt-get update -y && sudo apt-get -y install elasticsearch
c

#Configure Elasticsearch to automatically start during bootup :
update-rc.d elasticsearch defaults 95 10
c

# Если надо будет убрать автозапуск, делается это командой:
# update-rc.d -f elasticsearch remove


green "##############################################################"
green " INSTALLING KOPF 1.4.7"
green " Start elastic and open :  http://localhost:9200/_plugin/kopf/"
green "##############################################################"

/usr/share/elasticsearch/bin/plugin --install lmenezes/elasticsearch-kopf/1.4.7
c




green "CHANGE HEAP ZIZE to: $HEAP_SIZE ##############################"
green "## replacing ES_HEAP_SIZE in /etc/default/elasticsearch ######"

#sed -i -e 's/.*ES_HEAP_SIZE=.*/ES_HEAP_SIZE=8g/' /etc/init.d/elasticsearch
sed -i -e "s/.*ES_HEAP_SIZE=.*/ES_HEAP_SIZE=$HEAP_SIZE/" /etc/default/elasticsearch
c




 
green "##############################################################"
green "##############################################################"
green "SET CLUSTER"
green "##############################################################"
green "##############################################################"


echo -e  "\n###########  SPECIFIC TO $CLUSTER_NAME  ######################\n" >> /etc/elasticsearch/elasticsearch.yml
c
echo -e "cluster.name: \"$CLUSTER_NAME\"" >> /etc/elasticsearch/elasticsearch.yml
c
echo "node.name: \"$NODE_NAME\"" >> /etc/elasticsearch/elasticsearch.yml
c
echo "script.disable_dynamic: true" >> /etc/elasticsearch/elasticsearch.yml
c
echo "bootstrap.mlockall: true" >> /etc/elasticsearch/elasticsearch.yml
c
echo "discovery.zen.minimum_master_nodes: $MININUM_MASTER_NODES" >> /etc/elasticsearch/elasticsearch.yml
c
echo "discovery.zen.ping.timeout: 15s" >> /etc/elasticsearch/elasticsearch.yml
c

#network.publish_host:  "55.55.55.55"
#c
#echo "discovery.zen.ping.multicast.enabled: false" >> /etc/elasticsearch/elasticsearch.yml
#c
#echo 'discovery.zen.ping.unicast.hosts: ["ip1", "ip2"]' >> /etc/elasticsearch/elasticsearch.yml
#c


/etc/init.d/elasticsearch start
c



