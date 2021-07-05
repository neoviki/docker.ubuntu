#!/bin/bash

install_packages()
{
apt-get update -y 1>/dev/null 2>/dev/null
apt-get install -y apt-utils
apt-get install -y iputils-ping
apt-get install -y openssh-server
apt-get install -y lsb-release 
apt-get install -y curl 
apt-get install -y vim 
apt-get install -y net-tools 
apt-get install -y iputils-ping 
apt-get install -y software-properties-common
apt-get update -y

ln -fs /usr/share/zoneinfo/UTC /etc/localtime
apt-get update -y
DEBIAN_FRONTEND="noninteractive" apt-get -y install tzdata

# Clean package list to save space
#rm -rf /var/lib/apt/lists/* 

# Clean package cache to save space
#apt-get clean
}

install_packages

