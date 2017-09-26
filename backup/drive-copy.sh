#!/usr/bin/env bash

source ../config.sh
source rsync.sh

SRC="$DRIVEMAIN$DRIVEMAINAPPEND/"
DEST="$DRIVESECONDARY$DRIVESECONDARYAPPEND/"
RSYNC_DELETE="false"
RSYNC_LOG="true"
RSYNC_DRY="false"
RSYNC_EXCLUDE_MAC="true"

run_rsync
