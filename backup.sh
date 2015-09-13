#!/usr/bin/env bash

#
# Backup Script
# 
# Usage: 
# 
# git clone git@github.com:patrickheeney/dotfiles.git ~/dotfiles
# cd ~/dotfiles
# chmod +x backup.sh
# ./backup.sh
#

set -e
#set -x

# Current dir
DIR="$( cd -P "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"

# Print a message to the console.
log() { printf "$*\n" ; return $? ; }

# Print an error message to the console and bail out of the script.
fail() { log "\nERROR: $*\n" ; exit 1 ; }

#
# Start
#
log "Starting backup..."

#
# Fix permissions
#
log "Fixing permissions"
chmod -R +x backup/

#
# backup ssh
#
log "Backup SSH"
$DIR/backup/ssh.sh

#
# We made it!
#
log ""
log ""
log "Done!"
