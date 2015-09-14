#!/usr/bin/env bash

read -p "What is the name of the dropbox folder: Dropbox (xxx)? " FOLDER

SRC=~/"Dropbox ($FOLDER)"/
DEST=/Volumes/Backup/"$FOLDER"

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

# Rsync the $SRC to $DEST
rsync \
    --archive \
    --verbose \
    --compress \
    --exclude __MACOSX \
    --exclude .DS_Store \
    --exclude '.dropbox.cache' \
    "$SRC" "$DEST"
