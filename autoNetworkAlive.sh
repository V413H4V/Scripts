#!/bin/bash
#@author: Vaibhav Murkute

IPADDRESS=$(eval ifconfig wlan0 | egrep -o "inet [^ ]*" | grep -o "[0-9.]*");
echo "Your IP Address: $IPADDRESS";
NETWORKADD="${IPADDRESS%.*}";
HOSTS='.{1..255}';
IPBASE="$NETWORKADD$HOSTS";
echo '================Scanning for all 255 hosts======================';
for ip in $(eval echo "$IPBASE") ;
do
	(
	ping $ip -c 1 &> /dev/null ;

	if [ $? -eq 0 ] ;
	then
		echo $ip is alive;
	fi
	)&
done
wait
