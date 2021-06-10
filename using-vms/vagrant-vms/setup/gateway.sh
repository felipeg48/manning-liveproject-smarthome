#!/usr/bin/env bash
echo "** Starting setup as: $(whoami)"

# Ubuntu Box
echo "** 1/4 Updating"
apt update > /dev/null 2>&1
echo "** 2/4 Upgrading"
apt upgrade -y > /dev/null 2>&1
echo "** 3/4 Installing"
apt install wget net-tools openjdk-11-jdk redis-server -y > /dev/null 2>&1
echo "** 4/4 Modifying Redis configuration.."
sed -i "s/bind 127.0.0.1/bind 0.0.0.0/" /etc/redis/redis.conf
/etc/init.d/redis-server restart
echo "** Done"
echo "** Configuring Hosts..."
echo "192.168.51.10 gateway gateway.home.smart" >> /etc/hosts
echo "192.168.51.11 mqtt mqtt.home.smart" >> /etc/hosts
echo "192.168.51.12 devices devices.home.smart" >> /etc/hosts
echo "192.168.51.13 things things.home.smart" >> /etc/hosts
echo "** Done"