#!/bin/bash
#@author: Vaibhav Murkute

echo "Enter base network address (for ex 192.168.2):";
read ipBase;
hosts='.{1..255}';
ipBase="$ipBase$hosts";
echo '================Scanning for all 255 hosts======================';
for ip in $(eval echo "$ipBase") ;
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
