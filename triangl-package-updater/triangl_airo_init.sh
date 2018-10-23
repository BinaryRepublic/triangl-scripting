#! /bin/bash
iw phy phy0 info
iw phy phy0 interface add mon0 type monitor

rm -rf /triangl-package-updater/test.csv-01.csv
airodump-ng --output-format csv --write test.csv --channel 6 --berlin 14 mon0 &
