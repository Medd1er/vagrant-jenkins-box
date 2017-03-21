#!/bin/bash
# Console colors
NC=$(echo -e "\033[0m")
GR=$(echo -e "\033[32m")
RD=$(echo -e "\033[31m")
YW=$(echo -e "\033[33m")
BD=$(echo -e "\033[1m")
sudo su
echo "$BD$YW-> Jenkins Server startup$NC"
cd ~/Downloads/
java -jar jenkins.war &
sleep 60
JPWD=$(cat ~/.jenkins/secrets/initialAdminPassword)
echo "$BD$YW-> Open link in your browser 'http://localhost:8080' and enter initial password generated below.$NC"
echo "$BD$YW-> $JPWD$NC"