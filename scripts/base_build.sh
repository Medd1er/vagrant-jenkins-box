#!/bin/bash
# Console colors
NC=$(echo -e "\033[0m")
GR=$(echo -e "\033[32m")
RD=$(echo -e "\033[31m")
YW=$(echo -e "\033[33m")
BD=$(echo -e "\033[1m")
echo "-> Base script for Jenkins server"
sudo su
# Base packages install
echo "$BD$YW-> Updating repos$NC"
yum update
echo "$BD$YW-> Installing additional packages$NC"
yum install -y wget yum-utils
yum-config-manager --add-repo https://download.docker.com/linux/centos/docker-ce.repo
yum makecache fast
echo "$BD$YW-> Installing Java 8$NC"
# Creating folders
mkdir ~/Downloads
mkdir /usr/java
# Java install
cd ~/Downloads
wget http://javadl.oracle.com/webapps/download/AutoDL?BundleId=218822_e9e7ea248e2c4826b92b3f075a80e441 -O jre-8u121-linux-x64.rpm
cd /usr/java
rpm -ivh ~/Downloads/jre-8u121-linux-x64.rpm
# Install Docker for pipelines
yum -y install docker-ce
systemctl start docker
docker run hello-world
# Jenkins install
echo "$BD$YW-> Downloading Jenkins$NC"
cd ~/Downloads/
wget http://mirrors.jenkins.io/war-stable/latest/jenkins.war
