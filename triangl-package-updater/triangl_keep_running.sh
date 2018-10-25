#! /bin/bash

while true
do
	sleep 5
        if ps | grep -q "[a]irodump-ng"
        then
                continue
        else
                sh /triangl-package-updater/triangl_airo_init.sh > /dev/null 2> /dev/null &
        fi
	sleep 2
	if ps | grep -q "[h]elloworld"
	then
		continue
	else
<<<<<<< HEAD
		rssi-polling 2> /triangl-package-updater/rssi_polling.log &
=======
		# TODO: Add logging
		helloworld > /dev/null &
>>>>>>> d239cd333194833df502561652083b9820d0b93d
	fi
done
