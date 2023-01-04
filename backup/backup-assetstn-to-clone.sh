#!/usr/bin/env bash

# Clone is smaller, can only backup subset

source ../config.sh
source functions.sh

TIME=$(date +%Y%m%d-%H%M)
USER=$(whoami)

SOURCE=/Volumes/AssetStn
DESTINATION=/Volumes/AssetCln

SOURCEASSETDIR="$SOURCE/Assets"
DESTINATIONASSETDIR="$DESTINATION/Assets"

SOURCEGAMEDIR="$SOURCE/RetroGames"
DESTINATIONGAMEDIR="$DESTINATION/RetroGames"

SOURCETABLETOPDIR="$SOURCE/TabletopAssets"
DESTINATIONTABLETOPDIR="$DESTINATION/TabletopAssets"

SOURCETVDIR="$SOURCE/TV"
DESTINATIONTVDIR="$DESTINATION/TV"

check_mount "$SOURCE"
check_mount "$DESTINATION"

# Assets

check_directory "$SOURCEASSETDIR"
# check_directory "$DESTINATIONASSETDIR"

rsync \
	--archive \
	--compress \
	--verbose \
	--stats \
	--progress \
	--itemize-changes \
	"$SOURCEASSETDIR/" "$DESTINATIONASSETDIR/"
	# --delete --delete-during --delete-excluded \

# Games

check_directory "$SOURCEGAMEDIR"
# check_directory "$DESTINATIONGAMEDIR"

rsync \
	--archive \
	--compress \
	--verbose \
	--stats \
	--progress \
	--itemize-changes \
	"$SOURCEGAMEDIR/" "$DESTINATIONGAMEDIR/"
	# --delete --delete-during --delete-excluded \

# Tabletop

check_directory "$SOURCETABLETOPDIR"
# check_directory "$DESTINATIONTABLETOPDIR"

rsync \
	--archive \
	--compress \
	--verbose \
	--stats \
	--progress \
	--itemize-changes \
	"$SOURCETABLETOPDIR/" "$DESTINATIONTABLETOPDIR/"
	# --delete --delete-during --delete-excluded \

# TV

check_directory "$SOURCETVDIR"
# check_directory "$DESTINATIONTVDIR"

rsync \
	--archive \
	--compress \
	--verbose \
	--stats \
	--progress \
	--itemize-changes \
	"$SOURCETVDIR/" "$DESTINATIONTVDIR/"
	# --delete --delete-during --delete-excluded \
