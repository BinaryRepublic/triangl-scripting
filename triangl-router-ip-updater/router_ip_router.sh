#!/bin/bash
TOKEN='xoxp-432130389943-431266889157-441832687649-f2994c3752584d6933b9b4c965dd3977'
MESSAGE='Hello World'
source ./.router_update_log

while true
do
	for sn in 1 2 3 4 5 6 7
	#for sn in 4
	do
		ip79=$(sudo nmap -sP 10.0.$sn.1/25 | grep -B 2 AC:84:C6:E8:BE:79 | \
		grep -o -e '[0-9]\+\.[0-9]\+\.[0-9]\+\.[0-9]\+')
		if [ "$ip79" != "$IP79" ] && [ "$ip79" != "" ]
		then
			MESSAGE="The new ip address of AC:84:C6:E8:BE:*79* is $ip79"
			IP79="$ip79"
			curl -X POST -H "Content-Type: application/json"\
			 -H "Authorization: Bearer $TOKEN"\
			 --data "{\"channel\":\"hardware_updates\",\"text\":\"$MESSAGE\"}"\
			 https://slack.com/api/chat.postMessage > /dev/null
			sed -i -e "1s/.*/IP79=$ip79/" .router_update_log
		fi
		ipD4=$(sudo nmap -sP 10.0.$sn.1/25 | grep -B 2 AC:84:C6:E8:C9:D4 | \
		grep -o -e '[0-9]\+\.[0-9]\+\.[0-9]\+\.[0-9]\+')
		if [ "$ipD4" != "$IPD4" ] && [ "$ipD4" != "" ]
		then
			MESSAGE="The new ip address of AC:84:C6:E8:C9:*D4* is $ipD4"
			IPD4="$ipD4"
			curl -X POST -H "Content-Type: application/json"\
			 -H "Authorization: Bearer $TOKEN"\
			 --data "{\"channel\":\"hardware_updates\",\"text\":\"$MESSAGE\"}"\
			 https://slack.com/api/chat.postMessage > /dev/null
			sed -i -e "2s/.*/IPD4=$ipD4/" .router_update_log
		fi
		ipE6=$(sudo nmap -sP 10.0.$sn.1/25 | grep -B 2 AC:84:C6:E8:C0:E6 | \
		grep -o -e '[0-9]\+\.[0-9]\+\.[0-9]\+\.[0-9]\+')
		if [ "$ipE6" != "$IPE6" ] && [ "$ipE6" != "" ]
		then
			MESSAGE="The new ip address of AC:84:C6:E8:C0:*E6* is $ipE6"
			IPE6="$ipE6"
			curl -X POST -H "Content-Type: application/json"\
			 -H "Authorization: Bearer $TOKEN"\
			 --data "{\"channel\":\"hardware_updates\",\"text\":\"$MESSAGE\"}"\
			 https://slack.com/api/chat.postMessage > /dev/null
			sed -i -e "3s/.*/IPE6=$ipE6/" .router_update_log
		fi
		ip6E=$(sudo nmap -sP 10.0.$sn.1/25 | grep -B 2 AC:84:C6:E8:C0:6E | \
		grep -o -e '[0-9]\+\.[0-9]\+\.[0-9]\+\.[0-9]\+')
		if [ "$ip6E" != "$IP6E" ] && [ "$ip6E" != "" ]
		then
			MESSAGE="The new ip address of AC:84:C6:E8:C0:*6E* is $ip6E"
			IP6E="$ip6E"
			curl -X POST -H "Content-Type: application/json"\
			 -H "Authorization: Bearer $TOKEN"\
			 --data "{\"channel\":\"hardware_updates\",\"text\":\"$MESSAGE\"}"\
			 https://slack.com/api/chat.postMessage > /dev/null
			sed -i -e "4s/.*/IP6E=$ip6E/" .router_update_log
		fi
	done
done

#curl -X POST -H "Content-Type: application/json" -H "Authorization: Bearer $TOKEN" --data "{\"channel\":\"hardware_updates\",\"text\":\"$MESSAGE\"}" https://slack.com/api/chat.postMessage
