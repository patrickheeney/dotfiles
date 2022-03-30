#!/usr/bin/env bash

# Notes
# https://www.launchd.info/
# http://stackoverflow.com/questions/132955/how-do-i-set-a-task-to-run-every-so-often

# Current dir
DIR="$( cd -P "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"
LAUNCHDIR="$( dirname "$DIR" )/launchd"

installsystem() {
  from="$LAUNCHDIR/$1"
  to=/Library/LaunchDaemons/"$1"
  echo "Linking '$from' to '$to'"
  # cp -f "$from" "$to"
  ln -s "$from" "$to"
  launchctl load -w "$to"
}

removesystem() {
  from=/Library/LaunchDaemons/"$1"
  echo "Removing '$from'"
  launchctl unload -w "$from"
  rm -f "$from"
}

installagent() {
  from="$LAUNCHDIR/$1"
  to=/Library/LaunchAgents/"$1"
  echo "Linking '$from' to '$to'"
  # cp -f "$from" "$to"
  ln -s "$from" "$to"
  launchctl load -w "$to"
}

removeagent() {
  from=/Library/LaunchAgents/"$1"
  echo "Removing '$from'"
  launchctl unload -w "$from"
  rm -f "$from"
}

installuser() {
  from="$LAUNCHDIR/$1"
  to=~/Library/LaunchAgents/"$1"
  echo "Linking '$from' to '$to'"
  # cp -f "$from" "$to"
  ln -s "$from" "$to"
  launchctl load -w "$to"
}

removeuser() {
  from=~/Library/LaunchAgents/"$1"
  echo "Removing '$from'"
  launchctl unload -w "$from"
  rm -f "$from"
}

echo "Installing launchd from $LAUNCHDIR"

# Setup
mkdir -p ~/Library/LaunchAgents/

# User
removeuser "com.patrickheeney.backupaccounting.plist"
removeuser "com.patrickheeney.backupsnapshot.plist"

installuser "com.patrickheeney.backupaccounting.plist"
installuser "com.patrickheeney.backupsnapshot.plist"
