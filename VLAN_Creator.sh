#!/bin/bash
x=17

cd /etc/sysconfig/network

counter=1
ip1=1
ip2=0
ip3=0

while [ $counter -le $x ]
do
        {
                echo 'IPADDR='10.$ip3.$ip2.$ip1/28''
                echo 'BOOTPROTO='static''
                echo 'STARTMODE='auto''
                echo 'ZONE='public''
                echo 'ETHERDEVICE='eth1''
                echo 'VLAN_ID='$counter''
        } > "ifcfg-vlan$counter"

        if [ $ip1 -eq 241 ];
        then
			if [ $ip2 -eq 255 ];
			then
				ip2=0
				((ip3+=1))
			else
				((ip2+=1))
			fi
			ip1=1
        else
                ((ip1+=16))
        fi

        ((counter++))
done

service network restart