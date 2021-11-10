#!/bin/bash

execToFound=$1

if [ -z ${execToFound} ]
then
	echo 'Usage : ./findSystemdServices.sh <excutable_name>'
	exit
fi

systemdServices=$(locate -b *.service)
for service in $systemdServices 
do 
	
	 #echo -n $service | awk 'BEGIN{FS=/} {print}' 
	 if  [[ $(cat $service 2>/dev/null | egrep $execToFound | wc -c) -gt 0 ]]
	 then
		 echo "$execToFound find in  $service"
	 fi

 done
