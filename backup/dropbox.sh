#!/usr/bin/env bash

read -p "What is the name of the dropbox folder: Dropbox (xxx)? " FOLDER

SRC=~/"Dropbox ($FOLDER)"/
DEST=/Volumes/Resources/"$FOLDER"

echo "Source: $SRC"
echo "Destination: $DEST"

if [ ! -d "$SRC" ]; then
  echo "Source does not exist"
  exit 1
fi

if [ ! -d "$DEST" ]; then
  echo "Destination does not exist"
  exit 1
fi

# build options
OPTS=""

# archive / compress
OPTS="$OPTS --archive"
OPTS="$OPTS --compress"

# output options
#OPTS="$OPTS --verbose"
OPTS="$OPTS --stats"
OPTS="$OPTS --progress"

# delete files on remote during rsync and also delete excluded
#OPTS="$OPTS --delete --delete-during --delete-excluded"

# only process existing files
#OPTS="$OPTS --existing"

# skip existing files
OPTS="$OPTS --ignore-existing"

# update only if files are newer
#OPTS="$OPTS --update"

# exclude files/folders
OPTS="$OPTS --exclude-from=rsync-exclude.txt"

# convert filenames
# http://serverfault.com/questions/638316/rsync-iconv-option-on-mac-not-working-sync-from-remote-linux-server-to-local
OPTS="$OPTS --iconv=utf-8-mac,utf-8"

# exclude files over 2GB
OPTS="$OPTS --max-size=2G --exclude='.*'"

# do a test run
#OPTS="$OPTS --dry-run"

# Rsync the $SRC to $DEST
rsync $OPTS "$SRC" "$DEST"
