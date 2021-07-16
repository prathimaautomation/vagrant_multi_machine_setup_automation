!#/bin/bash

sudo ln -s /home/vagrant/db/mongod.conf /etc/mongod.conf

sudo cat mongod.conf

sudo systemctl restart mongod
sudo systemctl enable mongod
sudo systemctl status mongod
# entering the key for mongodb login
sudo apt-key adv --keyserver hkp://keyserver.ubuntu.com:80 --recv D68FA50FEA312927
echo "deb https://repo.mongodb.org/apt/ubuntu xenial/mongodb-org/3.2 multiverse" | sudo tee /etc/apt/sources.list.d/mongodb-org-3.2.list

sudo apt-get update -y
sudo apt-get upgrade -y

# sudo apt-get install mongodb-org=3.2.20 -y
sudo apt-get install -y mongodb-org=3.2.20 mongodb-org-server=3.2.20 mongodb-org-shell=3.2.20 mongodb-org-mongos=3.2.20 mongodb-org-tools=3.2.20

# deleting the the default .conf and replace with our configuration
sudo rm /etc/mongod.conf
sudo ln -s /home/vagrant/environment/mongod.conf /etc/mongod.conf

# if mongodb set up correctly these will be successful
sudo systemctl restart mongod
sudo systemctl enable mongod
sudo systemctl status mongod