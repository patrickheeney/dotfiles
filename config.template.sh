# Rename to config.sh
MAINEMAIL=[REPLACE:Mac email address]

DRIVEMAIN=/volumes/ABC
DRIVEMAINAPPEND=/Folder
DRIVESECONDARY=/volumes/XYZ
DRIVESECONDARYAPPEND=/Folder

SNAPSHOTFOLDERS=("$DRIVEMAIN/$DRIVEMAINAPPEND/Test1" "$DRIVEMAIN/$DRIVEMAINAPPEND/Test2")
SNAPSHOTEXCLUDE=()
SNAPSHOTOUTPUT="$DRIVEMAIN/Backups/snapshots"