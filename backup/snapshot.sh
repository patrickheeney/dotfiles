#!/usr/bin/env bash

source ../config.sh

TIME=$(date +%Y%m%d-%H%M)

# Ideas:
# http://anouar.adlani.com/2011/12/how-to-backup-with-rsync-tar-gpg-on-osx.html
# https://github.com/frdmn/tar-multibackup/blob/master/multibackup
# https://github.com/tritonas00/system-tar-and-restore/blob/master/backup.sh
# https://github.com/dave-irvine/Tar-Multi-Volume

# Iterate through tar_excludes to create a "--exclude=XXX" combination string
tar_exclude_parameters=()
if [[ "${#SNAPSHOTEXCLUDE[@]}" -ne 0 ]]; then
  # Run each pre command
  for parameter in "${SNAPSHOTEXCLUDE[@]}"; do
    tar_exclude_parameters+=( "--exclude=${parameter}" )
  done
fi

for i in ${SNAPSHOTFOLDERS[@]}; do
  FOLDER=${i}
  
  # Get folder name and lowercase it
  # NAME=$(basename ${i})
  NAME=${i##*/}
  NAME="$(echo $NAME | tr '[A-Z]' '[a-z]')"
  
  if [ -d "$FOLDER" ]; then
    FILE="$NAME-$TIME.tar.gz"
    
    echo "Generating backup for $FOLDER at $SNAPSHOTOUTPUT/$FILE"
    
    # cd $FOLDER
    # tar cf - . --exclude=$FILE | pv -s `du -sb . | grep -o '[0-9]\+'` -N tar | gzip > $FILE
    # tar cf - $FOLDER -P | pv -s $(($(du -sk $FOLDER | awk '{print $1}') * 1024)) | gzip > $FILE
    # tar -cvzf - . | split --bytes=2048MB - $FILE.
    # mv $FILE.* $SNAPSHOTOUTPUT
    # tar -czf . --checkpoint=.1000 $FILE
    # SIZE=`du -sk $FOLDER | cut -f 1`
    # tar -cvf - $FOLDER | pv -p -s ${SIZE}k | gzip > $FILE
    # SIZE=`du -sk $FOLDER | cut -f 1`
    # tar -cv --exclude=$FILE $tar_exclude_parameters -f - . | pv -p -s ${SIZE}k | gzip > $FILE
    
    OPTS=""
    OPTS="$OPTS --create"
    OPTS="$OPTS --verbose"
    OPTS="$OPTS --gzip"
    OPTS="$OPTS --exclude=$FILE"
    OPTS="$OPTS $tar_exclude_parameters"
    OPTS="$OPTS --file=$FILE"

    cd $FOLDER
    tar $OPTS .
    mv $FILE $SNAPSHOTOUTPUT
  else
    echo "[$NAME] Folder does not exist: $FOLDER"
  fi
done

# Remove old backups
# if [[ ! -z "${SNAPSHOTRETENTION}" ]]; then
#   find "${SNAPSHOTOUTPUT}/" -maxdepth 1 -mtime "${SNAPSHOTRETENTION}" -type d -exec rm -rf {} \;
# fi
