#! /bin/bash

while true
do
	sleep 5
        if ps | grep -q "[a]irodump-ng"
        then
                continue
        else
                sh /triangl-package-updater/triangl_airo_init.sh &
        fi
	sleep 2
	if ps | grep -q "[h]elloworld"
	then
		continue
	else
		helloworld &
	fi
done