#!/usr/bin/env bash

SRC=~/Accounting/
DEST=/Volumes/Cabinet/Accounting

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
    $SRC $DEST

    #--delete \
