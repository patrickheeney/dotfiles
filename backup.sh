#!/usr/bin/env bash

#
# Backup Script
#
# Usage:
#
# chmod +x backup.sh
# ./backup.sh
#

set -e
#set -x

# Current dir
DIR="$( cd -P "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"

#
# Start
#
echo "Starting backup..."

#
# Backup ssh
#
echo "Backing up SSH..."
$DIR/backup/ssh.sh

#
# Backup ssh
#
echo "Backing up accounting..."
$DIR/backup/accounting.sh

#
# Backup ssh
#
echo "Backing up imac..."
$DIR/backup/imac.sh

#
# We made it!
#
echo ""
echo ""
echo "Done!"
