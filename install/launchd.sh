#!/usr/bin/env bash

# Notes
# http://stackoverflow.com/questions/132955/how-do-i-set-a-task-to-run-every-so-often

# Current dir
DIR="$( cd -P "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"
LAUNCHDIR="$DIR/../launchd"

installsystem() {
  from="$LAUNCHDIR/$1"
  to=/Library/LaunchDaemons/"$1"
  echo "Copying '$from' to '$to'"
}

installagent() {
  from="$LAUNCHDIR/$1"
  to=/Library/LaunchAgents/"$1"
  echo "Copying '$from' to '$to'"
}

installuser() {
  from="$LAUNCHDIR/$1"
  to=~/Library/LaunchAgents/"$1"
  echo "Copying '$from' to '$to'"
  #rm -f "$to"
  cp -f "$from" "$to"
  launchctl load -w "$to"
}

echo "Installing launchd from $LAUNCHDIR"

# User
installuser "com.patrickheeney.backup.accounting.plist"
