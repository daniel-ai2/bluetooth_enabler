#!/bin/bash

# Fail on errors: https://wizardzines.com/comics/bash-errors/
set -e

# Find the blueutil binary in a few common locations
blueutil=""
bins=("/opt/homebrew/bin" "/usr/local/bin")
for p in ${bins[@]}; do
    bp="$p/blueutil"
    if [[ -x "$bp" ]]; then
        blueutil=$bp
        break
    fi
done

# If we couldn't find it, fail fast.
if [[ -z "$blueutil" ]]; then
    echo "[$(date +"%Y-%m-%dT%H:%M:%S%z")] error: blueutil not installed"
    exit 1
fi

# If bluetooth is already enabled, we don't need to do anything
if [[ $($blueutil -p) == 1 ]]; then
    echo "[$(date +"%Y-%m-%dT%H:%M:%S%z")] Bluetooth already enabled"
    exit 0
fi

# - Enter trusted SSIDs here, separated by spaces - #
workSSID=("ai2 Team" "ai2 guest")

currentSSID=$(/System/Library/PrivateFrameworks/Apple80211.framework/Resources/airport -I | awk -F' SSID: '  '/ SSID: / {print $2}')

# Determine if the current SSID is trusted.
trusted=false
for i in ${!workSSID[@]}; do
    ssid=${workSSID[$i]}
	if [[ "$ssid" == "$currentSSID" ]]; then
        trusted=true
        break
	fi
done

# Fail fast if it's not
if [[ $trusted == false ]]; then
    echo "[$(date +"%Y-%m-%dT%H:%M:%S%z")] $currentSSID is not trusted"
    exit 0
fi

# It is, enable bluetooth!
$blueutil -p 1
echo "[$(date +"%Y-%m-%dT%H:%M:%S%z")] Bluetooth enabled"
