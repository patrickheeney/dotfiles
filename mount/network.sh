#!/bin/bash

# https://www.arqbackup.com/blog/nas-backup/
# //[user]@[ip]/fileshare on /Volumes/fileshare (smbfs, nodev, nosuid, mounted by [user])
# //[user]@[ip]/mediashare on /Volumes/mediashare (smbfs, nodev, nosuid, mounted by [user])

source ../config.sh

# If the NAS isn't reachable via ping, exit 1.
# Otherwise, the osascript will pop up an unwanted dialog.
# ping -c 1 big.local
# if [[ $? -ne 0 ]]; then
#     echo "ping failed"
#     exit 1
# fi

FILEMOUNT=/Volumes/fileshare
MEDIAMOUNT=/Volumes/mediashare

if mount | grep "on $FILEMOUNT" > /dev/null; then
    echo "$FILEMOUNT: ALREADY MOUNTED"
else
	open "smb://$SMBFSUSER:$SMBFSPASS@$SMBFSADDR/fileshare"
	# /sbin/mount -t smbfs "//$SMBFSUSER:$SMBFSPASS@$SMBFSADDR/fileshare" "$FILEMOUNT"
	echo "$FILEMOUNT: MOUNTED"
fi

if mount | grep "on $MEDIAMOUNT" > /dev/null; then
    echo "$MEDIAMOUNT: ALREADY MOUNTED"
else
	open "smb://$SMBFSUSER:$SMBFSPASS@$SMBFSADDR/mediashare"
	# /sbin/mount -t smbfs "//$SMBFSUSER:$SMBFSPASS@$SMBFSADDR/mediashare" "$MEDIAMOUNT"
	echo "$MEDIAMOUNT: MOUNTED"
fi

# osascript <<EOD
# tell application "Finder"
# if not (disk "bignas" exists) then
# mount volume "afp://user:password@big/bignas"
# end if
# end tell
# EOD
