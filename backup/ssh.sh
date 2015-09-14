#!/usr/bin/env bash

DEST=~/"Dropbox (Personal)"/Private/SSH/
FILENAME=ssh_$(date +"%Y%m%d_%H%M%S").tar.gz

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

# Create 
tar -cvzf $FILENAME \
    --exclude __MACOSX \
    --exclude .DS_Store \
    -C ~/.ssh/ .

# Move to destination folder
mv "$FILENAME" "$DEST"
