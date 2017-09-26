#!/usr/bin/env bash

source ../config.sh
source rsync.sh

SRC=~/Accounting/
DEST="$DRIVEMAIN$DRIVEMAINACCOUNTING/"
RSYNC_DELETE="false"
RSYNC_LOG="true"
RSYNC_DRY="false"
RSYNC_EXCLUDE_MAC="true"

run_rsync
