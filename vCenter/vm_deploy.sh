#!/bin/bash
echo "Enter 1 for MSM, 2 for CoreVM, 3 for MSP"
read -p "Select VM type: " input
read -p "Enter Hostname: " hostname
read -p "Enter IP Address: " ipaddress
read -p "Enter VM name: " vmname
sed -i "s/\(.*vami_hostname:.*\)/vami_hostname: '$hostname' /g" inventory.yml
sed -i "s/\(.*vami_ip_vision:.*\)/vami_ip_vision: '$ipaddress' /g" inventory.yml
sed -i "s/\(.*vm_name:.*\)/vm_name: '$vmname' /g" inventory.yml
#echo $input
#set -x
case $input in
    1)  
        hostname=$(ls /var/www/html/VxBC_3.0/ | grep -i 'msm');;
    2)
        hostname=$(ls /var/www/html/VxBC_3.0/ | grep -i 'core' | grep -v 'hotfix');;
    3)
        hostname=$(ls /var/www/html/VxBC_3.0/ | grep -i 'msp');;
esac
#hostname=file.ova
case $input in
    1)
        sed -i "s/\(.*ova_path:.*\)/ova_path: '\/var\/www\/html\/VxBC_3.0\/$hostname' /g" inventory.yml;;
    2) 
        sed -i "s/\(.*ova_path:.*\)/ova_path: '\/var\/www\/html\/VxBC_3.0\/$hostname' /g" inventory.yml;;
    3)
        sed -i "s/\(.*ova_path:.*\)/ova_path: '\/var\/www\/html\/VxBC_3.0\/$hostname' /g" inventory.yml;;
esac

ansible-playbook -v vm_deploy.yml
