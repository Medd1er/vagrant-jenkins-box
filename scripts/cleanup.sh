#!/bin/bash
NC=$(echo -e "\033[0m")
GR=$(echo -e "\033[32m")
RD=$(echo -e "\033[31m")
YW=$(echo -e "\033[33m")
BD=$(echo -e "\033[1m")
printf "$BD$YW-> Cleaning...$NC\n"
cd ~/Downloads
rm jre-8u121-linux-x64.rpm
# Removing
yum remove -y gcc kernel-devel perl
yum clean all
# Zero out the rest of the free space using dd, then delete the written file.
dd if=/dev/zero of=/EMPTY bs=1M
rm -f /EMPTY
# Add `sync` so Packer doesn't quit too early, before the large file is deleted.
sync