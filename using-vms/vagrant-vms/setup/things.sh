#!/usr/bin/env bash
echo "** Starting setup as: $(whoami)"

# Ubuntu Box
echo "** 1/5 Updating"
apt update > /dev/null 2>&1
echo "** 2/5 Upgrading"
apt upgrade -y > /dev/null 2>&1
echo "** 3/5 Installing Base components"
apt install wget net-tools gnupg openjdk-11-jdk -y > /dev/null 2>&1
echo "** 4/5 Installing and configuring Mongo"
wget -qO - https://www.mongodb.org/static/pgp/server-4.4.asc | sudo apt-key add -
echo "deb [ arch=amd64,arm64 ] https://repo.mongodb.org/apt/ubuntu focal/mongodb-org/4.4 multiverse" | sudo tee /etc/apt/sources.list.d/mongodb-org-4.4.list
sudo apt-get update
sudo apt-get install -y mongodb-org
sed -i "s/bind_ip = 127.0.0.1/bind_ip = 0.0.0.0/" /etc/mongodb.conf
/etc/init.d/mongodb restart
echo "** Done"
echo "** Configuring Hosts..."
echo "192.168.51.10 gateway gateway.home.smart" >> /etc/hosts
echo "192.168.51.11 mqtt mqtt.home.smart" >> /etc/hosts
echo "192.168.51.12 devices devices.home.smart" >> /etc/hosts
echo "192.168.51.13 things things.home.smart" >> /etc/hosts
echo "** Done"