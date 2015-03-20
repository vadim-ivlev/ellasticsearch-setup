echo "SETTING HEAP SIZE TO 8g ####################################################"
sed -i -e 's/.*ES_HEAP_SIZE=.*/ES_HEAP_SIZE=8g/' /etc/init.d/elasticsearch


