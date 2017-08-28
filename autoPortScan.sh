#!/bin/bash
#@author: Vaibhav Murkute

echo "Enter host IP Address:";
read HOSTIP;
echo "Enter ports to scan (separated by space):";
read PORTS;
#PORTS=(21 22 80 4444); <---- List of common ports for scan
echo '==============Analysing Ports===============';
for port in ${PORTS[@]} 
    do
      echo > /dev/tcp/$HOSTIP/$port &>/dev/null;
      if [[ $? -eq 0 ]];
	then
		echo "Host:$host Port:$port is open";
	else
		echo "Host:$host Port:$port is closed";
			fi
done
