#!/bin/bash
NC=$(echo -e "\033[0m")
GR=$(echo -e "\033[32m")
RD=$(echo -e "\033[31m")
YW=$(echo -e "\033[33m")
BD=$(echo -e "\033[1m")
printf "$BD$YW-> Cleaning...$NC\n"
cd ~/Downloads
rm jre-8u121-linux-x64.rpm