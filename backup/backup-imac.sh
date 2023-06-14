#!/usr/bin/env bash

source ../config.sh
source functions.sh

TIME=$(date +%Y%m%d-%H%M)
USER=$(whoami)

MOUNTDIR=$DRIVE_SOURCE_FILESTATION_VOLUME
SNAPSHOTDIR="$MOUNTDIR/Storage/Snapshots"
CABINETDIR="$MOUNTDIR/Cabinet"
CABINETACCOUNTINGDIR="$CABINETDIR/Accounting"

ACCOUNTINGDIR="/Users/$USER/Accounting"
QUICKENBACKUPDIR="/Users/$USER/Library/Application Support/Quicken/Backups/Automatic Backups"
QUICKENACCOUNTINGDIR="$ACCOUNTINGDIR/Quicken/BACKUP"

check_mount "$MOUNTDIR"

# Create keys snapshot

check_directory "$SNAPSHOTDIR"

FILENAME="keys-$TIME.tar.gz"
echo "CREATE $FILENAME"
tar -cvzf $FILENAME \
	--exclude __MACOSX \
	--exclude .DS_Store \
	/Users/$USER/OneDrive/HomeShare/Apps \
	/Users/$USER/OneDrive/Private/Apps \
	/Users/$USER/.ssh

echo "MOVE $FILENAME TO $SNAPSHOTDIR/$FILENAME"
mv $FILENAME "$SNAPSHOTDIR/$FILENAME"

# Migrate quicken backups
# Quickbooks backups are already there

check_directory "$QUICKENBACKUPDIR"
check_directory "$QUICKENACCOUNTINGDIR"

rsync \
	--archive \
	--compress \
	--verbose \
	--stats \
	--progress \
	--itemize-changes \
	"$QUICKENBACKUPDIR/" "$QUICKENACCOUNTINGDIR/"
	# --delete --delete-during --delete-excluded \

# Migrate accounting folder

check_directory "$ACCOUNTINGDIR"
check_directory "$CABINETACCOUNTINGDIR"

rsync \
	--archive \
	--compress \
	--verbose \
	--stats \
	--progress \
	--itemize-changes \
	"$ACCOUNTINGDIR/" "$CABINETACCOUNTINGDIR/"
	# --delete --delete-during --delete-excluded \

# Create cabinet snapshot

check_directory "$CABINETDIR"

FILENAME="cabinet-$TIME.tar.gz"
echo "CREATE $FILENAME"
tar -cvzf $FILENAME \
	--exclude __MACOSX \
    --exclude .DS_Store \
	-C $CABINETDIR .

echo "MOVE $FILENAME TO $SNAPSHOTDIR/$FILENAME"
mv $FILENAME "$SNAPSHOTDIR/$FILENAME"
