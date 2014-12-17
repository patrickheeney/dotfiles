#!/usr/bin/env bash

# Notes
# http://askubuntu.com/questions/343727/filenames-with-spaces-breaking-for-loop-find-command
# ${string##substring} - Deletes longest match of $substring from front of $string.
# ${string%substring} - Deletes shortest match of $substring from back of $string.

# Current dir
DIR="$( cd -P "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"

link() {
  from="$1"
  to="$2"
  echo "Linking '$from' to '$to'"
  rm -f "$to"
  ln -s "$from" "$to"
}

echo "Symlinking dotfiles from $DIR"

# Symlink bash files
find bash -type f -name '*' -print0 | while IFS= read -r -d '' location; do
  file="${location##*/}"
  file=".${file}"
  link "$DIR/$location" "$HOME/$file"
done

# Symlink git files
find git -type f -name '*' -print0 | while IFS= read -r -d '' location; do
  file="${location##*/}"
  file=".${file}"
  link "$DIR/$location" "$HOME/$file"
done

# Symlink sublime settings
find sublime -type f -name '*.sublime*' -print0 | while IFS= read -r -d '' location; do
  file="${location##*/}"
  link "$DIR/$location" "$HOME/Library/Application Support/Sublime Text 3/Packages/User/$file"
done

# Reset settings
source ~/.bash_profile
