echo "\n###########  SPECIFIC TO PAMYAT NARODA ######################\n" >> /etc/elasticsearch/elasticsearch.yml

echo 'cluster.name: "PamyatCluster"' >> /etc/elasticsearch/elasticsearch.yml
#echo 'node.name: "Host_108"' >> /etc/elasticsearch/elasticsearch.yml

echo "script.disable_dynamic: true" >> /etc/elasticsearch/elasticsearch.yml
echo "bootstrap.mlockall: true" >> /etc/elasticsearch/elasticsearch.yml
echo "discovery.zen.minimum_master_nodes: 4" >> /etc/elasticsearch/elasticsearch.yml
echo "discovery.zen.ping.timeout: 15s" >> /etc/elasticsearch/elasticsearch.yml

