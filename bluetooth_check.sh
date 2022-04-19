#!/bin/bash

# - Enter exempted work SSIDs here, separated by spaces - #

workSSID=("ai2 Team" "ai2 guest")

currentSSID=$(/System/Library/PrivateFrameworks/Apple80211.framework/Resources/airport -I | awk -F' SSID: '  '/ SSID: / {print $2}')

for i in ${!workSSID[@]};
do
	if [ $(/opt/homebrew/bin/blueutil -p) == 0 ] && [[ ${workSSID[$i]} == $currentSSID ]]; then
		/opt/homebrew/bin/blueutil -p 1
	fi
done
