#!/usr/bin/env bash

DEST=~/"Dropbox (Personal)"/Private/SSH/
FILENAME=ssh_$(date +"%Y%m%d_%H%M%S").tar.gz

echo "Destination: $DEST"

if [ ! -d "$DEST" ]; then
    echo "Destination does not exist"
    exit 1
fi

tar -cvzf $FILENAME \
  --exclude __MACOSX \
  --exclude .DS_Store \
  -C ~/.ssh/ .

# Move to destination folder
mv "$FILENAME" "$DEST"
