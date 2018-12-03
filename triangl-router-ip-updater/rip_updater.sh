#!/bin/bash
TOKEN='xoxp-432130389943-431266889157-456058349891-69bf2bd5b91ea94b136153d4cd2a037f'
MESSAGE='Hello World'
LAST_RESET=$(date +%d)
source '/usr/local/share/router_ip_updater_log/.router_update_log'


while true
do
	for sn in 1 2 3 4 5 6 7
	#for sn in 4
	do
		ip79=$(sudo nmap -sP 10.0.$sn.1/24 | grep -B 2 AC:84:C6:E8:BE:79 | \
		grep -o -e '[0-9]\+\.[0-9]\+\.[0-9]\+\.[0-9]\+')
		if [ "$ip79" != "$IP79" ] && [ "$ip79" != "" ]
		then
			MESSAGE="The new ip address of AC:84:C6:E8:BE:*79* is $ip79"
			IP79="$ip79"
			curl -X POST -H "Content-Type: application/json"\
			 -H "Authorization: Bearer $TOKEN"\
			 --data "{\"channel\":\"hardware_updates\",\"text\":\"$MESSAGE\"}"\
			 https://slack.com/api/chat.postMessage > /dev/null
			sudo sed -i -e "1s/.*/IP79=$ip79/" '/usr/local/share/router_ip_updater_log/.router_update_log'
		fi
		ipD4=$(sudo nmap -sP 10.0.$sn.1/24 | grep -B 2 AC:84:C6:E8:C9:D4 | \
		grep -o -e '[0-9]\+\.[0-9]\+\.[0-9]\+\.[0-9]\+')
		if [ "$ipD4" != "$IPD4" ] && [ "$ipD4" != "" ]
		then
			MESSAGE="The new ip address of AC:84:C6:E8:C9:*D4* is $ipD4"
			IPD4="$ipD4"
			curl -X POST -H "Content-Type: application/json"\
			 -H "Authorization: Bearer $TOKEN"\
			 --data "{\"channel\":\"hardware_updates\",\"text\":\"$MESSAGE\"}"\
			 https://slack.com/api/chat.postMessage > /dev/null
			sudo sed -i -e "2s/.*/IPD4=$ipD4/" '/usr/local/share/router_ip_updater_log/.router_update_log'
		fi
		ipE6=$(sudo nmap -sP 10.0.$sn.1/24 | grep -B 2 AC:84:C6:E8:C0:E6 | \
		grep -o -e '[0-9]\+\.[0-9]\+\.[0-9]\+\.[0-9]\+')
		if [ "$ipE6" != "$IPE6" ] && [ "$ipE6" != "" ]
		then
			MESSAGE="The new ip address of AC:84:C6:E8:C0:*E6* is $ipE6"
			IPE6="$ipE6"
			curl -X POST -H "Content-Type: application/json"\
			 -H "Authorization: Bearer $TOKEN"\
			 --data "{\"channel\":\"hardware_updates\",\"text\":\"$MESSAGE\"}"\
			 https://slack.com/api/chat.postMessage > /dev/null
			sudo sed -i -e "3s/.*/IPE6=$ipE6/" '/usr/local/share/router_ip_updater_log/.router_update_log'
		fi
		ip6E=$(sudo nmap -sP 10.0.$sn.1/24 | grep -B 2 AC:84:C6:E8:C0:6E | \
		grep -o -e '[0-9]\+\.[0-9]\+\.[0-9]\+\.[0-9]\+')
		if [ "$ip6E" != "$IP6E" ] && [ "$ip6E" != "" ]
		then
			MESSAGE="The new ip address of AC:84:C6:E8:C0:*6E* is $ip6E"
			IP6E="$ip6E"
			curl -X POST -H "Content-Type: application/json"\
			 -H "Authorization: Bearer $TOKEN"\
			 --data "{\"channel\":\"hardware_updates\",\"text\":\"$MESSAGE\"}"\
			 https://slack.com/api/chat.postMessage > /dev/null
			sudo sed -i -e "4s/.*/IP6E=$ip6E/" '/usr/local/share/router_ip_updater_log/.router_update_log'
		fi
		raspPi=$(ifconfig | grep -o -e '[0-9]\+\.[0-9]\+\.[0-9]\+\.[0-9]\+' | grep -e '^10\.0\.' | grep -v -e '10\.0\.7\.255')
		if [ "$raspPi" != "$RASPPI" ] && [ "$raspPi" != "" ]
		then
			MESSAGE="The new ip address of our Rasperry pi is $raspPi"
			RASPPI="$raspPi"
			curl -X POST -H "Content-Type: application/json"\
			 -H "Authorization: Bearer $TOKEN"\
			 --data "{\"channel\":\"hardware_updates\",\"text\":\"$MESSAGE\"}"\
			 https://slack.com/api/chat.postMessage > /dev/null
			sudo sed -i -e "5s/.*/RASPPI=$raspPi/" '/usr/local/share/router_ip_updater_log/.router_update_log'
		fi
	done
	current_day=$(date +%d)
	if [ "$current_day" -ne "$LAST_RESET" ]; then
		sudo sed -i -e "1s/.*/IP79=/" '/usr/local/share/router_ip_updater_log/.router_update_log'
		sudo sed -i -e "2s/.*/IPD4=/" '/usr/local/share/router_ip_updater_log/.router_update_log'
		sudo sed -i -e "3s/.*/IPE6=/" '/usr/local/share/router_ip_updater_log/.router_update_log'
		sudo sed -i -e "4s/.*/IP6E=/" '/usr/local/share/router_ip_updater_log/.router_update_log'
		sudo sed -i -e "5s/.*/RASPPI=/" '/usr/local/share/router_ip_updater_log/.router_update_log'
		source '/usr/local/share/router_ip_updater_log/.router_update_log'
		LAST_RESET=$current_day
	fi
done

#curl -X POST -H "Content-Type: application/json" -H "Authorization: Bearer $TOKEN" --data "{\"channel\":\"hardware_updates\",\"text\":\"$MESSAGE\"}" https://slack.com/api/chat.postMessage
