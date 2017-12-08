
run_rsync () {
  DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )/.."

  # build options
  OPTS=""

  # archive / compress
  OPTS="$OPTS --archive"
  OPTS="$OPTS --compress"

  # output options
  OPTS="$OPTS --verbose"
  OPTS="$OPTS --stats"
  # OPTS="$OPTS --progress"
  OPTS="$OPTS --itemize-changes"

  # delete files on remote during rsync and also delete excluded

  if [[ $RSYNC_DELETE == "true" ]]; then
    # --delete-during
    OPTS="$OPTS --delete --delete-excluded --delete-delay"
  fi

  # only process existing files
  #OPTS="$OPTS --existing"

  # skip existing files
  OPTS="$OPTS --ignore-existing"

  # update only if files are newer
  #OPTS="$OPTS --update"

  # exclude files/folders
  if [[ $RSYNC_EXCLUDE_MAC == "true" ]]; then
    OPTS="$OPTS --exclude-from=rsync-exclude.txt"
  fi

  # convert filenames
  # http://serverfault.com/questions/638316/rsync-iconv-option-on-mac-not-working-sync-from-remote-linux-server-to-local
  # initiating from mac
  OPTS="$OPTS --iconv=utf-8-mac,utf-8"
  # initiating from linux
  #OPTS="$OPTS --iconv=utf-8,utf-8-mac"

  # exclude files over 2GB
  #OPTS="$OPTS --max-size=2G --exclude='.*'"

  # log the result
  # if [[ $LOG == "true" ]]; then
  # OPTS="$OPTS --log-file=$DIR/rsync.log.`date +%Y%m%d-%H%M` --log-file-format='%i %o %f'"
  # fi

  # do a test run
  if [[ $RSYNC_DRY == "true" ]]; then
    OPTS="$OPTS --dry-run"
  fi

  # Rsync the $SRC to $DEST
  echo "rsync $OPTS $SRC $DEST"

  if [[ $RSYNC_LOG == "true" ]]; then
    rsync $OPTS "$SRC" "$DEST" | tee "$DIR/rsync.log.`date +%Y%m%d-%H%M`"
  else
    rsync $OPTS "$SRC" "$DEST"
  fi
}
