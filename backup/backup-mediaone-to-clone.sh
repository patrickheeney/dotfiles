#!/usr/bin/env bash

source ../config.sh
source rsync.sh

SRC="$DRIVE_SOURCE_MEDIAONE_VOLUME/"
DEST="$DRIVE_SOURCE_MEDIAONECLONE_VOLUME/"
RSYNC_DELETE="true"
RSYNC_LOG="false"
RSYNC_DRY="false"
RSYNC_EXCLUDE_MAC="true"

check_mount "$SRC" "$DEST"
run_rsync
