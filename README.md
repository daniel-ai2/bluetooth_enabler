# bluetooth_enabler

## Installation:

**Requires installation of blueutil via homebrew:** `brew install blueutil`

Place script wherever you like, then edit first line to include any networks you would like to mark as "safe" so that bluetooth remains turned on even when no devices are connected. 

Edit crontab file with `crontab -e` and add line `* * * * * /*full path to script*/bluetooth_check.sh >> /tmp/bt.log 2 >> tmp/bt.log `

Logs will be written to `/tmp/bt.log`. It'd be more conventional to write to `/var/log`, but then
we'd have to get permissions right.

If you are running MacOS 12+ you will also likely need to give full disk access to cron by going to Apple Icon > System Preferences > Security and Privacy > Privacy > Full Disk Access > Click the lock to unlock > Click + > Hold Cmd + Shift + G to bring up path navigation and type in /usr/sbin/cron and hit enter > Click Open > Click the Checkbox next to cron to enable

This script will check every minute if bluetooth is disabled and will re-enable it if you are on one of the specified wifi networks
