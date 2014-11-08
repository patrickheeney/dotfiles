#!/usr/bin/env bash

# Current dir
DIR="$( cd -P "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"

echo "Symlinking dotfiles from $DIR"

link() {
  from="$1"
  to="$2"
  echo "Linking '$from' to '$to'"
  rm -f "$to"
  ln -s "$from" "$to"
}

# Symlink bash files
for location in $(find bash -type f -name '*'); do
  file="${location##*/}"
  file=".${file%.sh}"
  link "$DIR/$location" "$HOME/$file"
done

# Symlink git files
for location in $(find git -type f -name '*'); do
  file="${location##*/}"
  file=".${file%.sh}"
  link "$DIR/$location" "$HOME/$file"
done

#f [[ `uname` == 'Darwin' ]]; then
#  link "$DIR/sublime/Packages/User/Preferences.sublime-settings" "$HOME/Library/Application Support/Sublime Text 3/Packages/User/Preferences.sublime-settings"
#fi

# Reset settings
source ~/.bash_profile
