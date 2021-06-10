#!/usr/bin/env bash
echo "** Starting setup as: $(whoami)"

# Ubuntu Box
echo "** 1/3 Updating"
apt update > /dev/null 2>&1
echo "** 1/3 Upgrading"
apt upgrade -y > /dev/null 2>&1
echo "** 1/3 Installing"
apt install wget net-tools openjdk-11-jdk -y > /dev/null 2>&1
echo "** Done"
echo "** Configuring Hosts..."
echo "192.168.51.10 gateway gateway.home.smart" >> /etc/hosts
echo "192.168.51.11 mqtt mqtt.home.smart" >> /etc/hosts
echo "192.168.51.12 devices devices.home.smart" >> /etc/hosts
echo "192.168.51.13 things things.home.smart" >> /etc/hosts
echo "** Done"