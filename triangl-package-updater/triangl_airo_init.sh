#!/bin/bash
interface=$(ifconfig | grep -o 'mon0')
if [ "$interface" == "" ]
then
	iw phy phy0 interface add mon0 type monitor
	ifconfig mon0 up
fi

rm -rf /triangl-package-updater/airodump-01.csv
airodump-ng --output-format csv --write /triangl-package-updater/airodump --channel 6 --berlin 14 mon0 > /dev/null 2> /dev/null &