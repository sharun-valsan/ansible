#!/bin/bash
read -p "Enter Hostname: " hostname
read -p "Enter IP Address: " ipaddress
read -p "Enter VM name: " vmname
sed -i "s/\(.*vami.hostname:.*\)/vami.hostname: '$hostname' /g" vm_deploy.yml
sed -i "s/\(.*vami.ip0.vision:.*\)/vami.ip0.vision: '$ipaddress' /g" vm_deploy.yml
sed -i "15s/\(.*name:.*\)/name: '$vmname' /g" vm_deploy.yml
ex -sc '15s/^/      /|x' vm_deploy.yml
ex -sc '24s/^/        /|x' vm_deploy.yml
ex -sc '25s/^/        /|x' vm_deploy.yml
ansible-playbook -v vm_deploy.yml
