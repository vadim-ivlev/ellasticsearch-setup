# Install MongoDB
# http://docs.mongodb.org/manual/tutorial/install-mongodb-on-ubuntu/

#1
#Import the public key used by the package management system.
#The Ubuntu package management tools (i.e. dpkg and apt) 
#ensure package consistency and authenticity by requiring 
#that distributors sign packages with GPG keys. 
#Issue the following command to import the MongoDB public GPG Key:

sudo apt-key adv --keyserver hkp://keyserver.ubuntu.com:80 --recv 7F0CEB10

#2
#Create a list file for MongoDB.
#Create the /etc/apt/sources.list.d/mongodb.list list file using the following command:

echo 'deb http://downloads-distro.mongodb.org/repo/ubuntu-upstart dist 10gen' | sudo tee /etc/apt/sources.list.d/mongodb.list

#3
#Reload local package database.
#Issue the following command to reload the local package database:

sudo apt-get update

#4
#Install the latest stable version of MongoDB.
#Issue the following command:

sudo apt-get install -y mongodb-org

