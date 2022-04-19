# bluetooth_enabler

## Installation:

**Requires installation of blueutil via homebrew:** `brew install blueutil`

Place script wherever you like, then edit first line to include any networks you would like to mark as "safe" so that bluetooth remains turned on even when no devices are connected. 

Edit crontab file with `crontab -e` and add line `* * * * * /*full path to script*/bluetooth_check.sh`

This script will check every minute if bluetooth is disabled and will re-enable it if you are on one of the specified wifi networks
