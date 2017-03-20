#!/bin/bash
echo "===> Base script for Jenkins server"
# Console colors
NC="\033[39m"
GR="\033[42m"
RD="\033[41m"
YW="\033[43m"
BD="\033[1m"
sudo su
# Base packages install
echo "$GR===> Updating repos$NC"
yum update
echo "$GR===> Installing additional packages$NC"
yum install -y httpd wget
echo "$GR===> Installing Java 8$NC"
# Java install
mkdir Downloads /usr/java
cd Downloads
wget http://javadl.oracle.com/webapps/download/AutoDL?BundleId=218822_e9e7ea248e2c4826b92b3f075a80e441 -O jre-8u121-linux-x64.rpm
cd /usr/java
rpm -ivh ~/Downloads/jre-8u121-linux-x64.rpm
# Jenkins install
echo $GR"===> Installing Jenkins"$NC
cd ~/Downloads/
wget http://mirrors.jenkins.io/war-stable/latest/jenkins.war
/usr/java/java -jar jenkins.war