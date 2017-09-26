#!/usr/bin/env bash

source ../config.sh
source rsync.sh

SRC="$DRIVEMAIN$DRIVEMAINBACKUP/"
DEST="$DRIVESECONDARY$DRIVESECONDARYBACKUP/"
RSYNC_DELETE="true"
RSYNC_LOG="true"
RSYNC_DRY="false"
RSYNC_EXCLUDE_MAC="true"

run_rsync
