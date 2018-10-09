#! /bin/bash

# Logs output to logfile
 exec >> logfile.txt


PACKET_NAME=rssi-polling
REPO=triangl-rssi-polling
API_TOKEN=09c8364f8a03ab05ae12c36e20385929924c3360 

check_updates() {
    source buildnum
    LATEST_SUCCESSFUL_BUILD=$(curl -s https://circleci.com/api/v1.1/project/github/codeuniversity/$REPO?circle-token\=$API_TOKEN\&limit\=20\&filter\=successful | jq '.[0] | .build_num')

    if [ $LATEST_SUCCESSFUL_BUILD -gt $INSTALLED_BUILD ]
    then
        echo "Newer build number $LATEST_SUCCESSFUL_BUILD found. Current build is $INSTALLED_BUILD."
        download_packet $LATEST_SUCCESSFUL_BUILD
    else
        sleep 5
        check_updates
    fi

}

download_packet() {
    DOWNLOAD_URL=$(curl -s https://circleci.com/api/v1.1/project/github/codeuniversity/$REPO/$LATEST_SUCCESSFUL_BUILD/artifacts?circle-token=$API_TOKEN | jq -r '.[0] | .url')
    echo Downloading packet
    curl -s -o $PACKET_NAME.ipk -L -k $DOWNLOAD_URL
    install_packet
}

install_packet() {
    echo Installing packet $PACKET_NAME.
    opkg install $PACKET_NAME.ipk
    if [ $? -eq 0 ]; then
        echo Successful install of build no. $LATEST_SUCCESSFUL_BUILD of $PACKET_NAME.
        echo INSTALLED_BUILD=$LATEST_SUCCESSFUL_BUILD>buildnum
        check_updates
    else
        echo Error when installing packet $LATEST_SUCCESSFUL_BUILD $(date +"%T")
    fi
}

check_updates