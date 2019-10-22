#!/bin/bash
read -p "Enter Hostname: " hostname
read -p "Enter IP Address: " ipaddress
read -p "Enter VM name: " vmname
sed -i "s/\(.*vami.hostname:.*\)/vami.hostname: '$hostname' /g" CoreVM_Deploy_Playbook.yml
sed -i "s/\(.*vami.ip0.vision:.*\)/vami.ip0.vision: '$ipaddress' /g" CoreVM_Deploy_Playbook.yml
sed -i "15s/\(.*name:.*\)/name: '$vmname' /g" CoreVM_Deploy_Playbook.yml
ex -sc '15s/^/      /|x' CoreVM_Deploy_Playbook.yml
ex -sc '24s/^/        /|x' CoreVM_Deploy_Playbook.yml
ex -sc '25s/^/        /|x' CoreVM_Deploy_Playbook.yml
ansible-playbook -v CoreVM_Deploy_Playbook.ym
