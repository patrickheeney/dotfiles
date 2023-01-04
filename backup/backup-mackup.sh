#!/bin/bash

#
# Mackup currently symlinks all files in place instead
# of copying to create a backup. This script uses mackup
# to get a list of paths but rsyncs the files instead
#
# https://github.com/lra/mackup/issues/613
# https://github.com/lra/mackup/issues/859
#

DIR=$(date +%Y_%m_%d)

# [ -d ~/.mackup ] || mkdir ~/.mackup
# cd ~/.mackup
[ -d ~/Mackup ] || mkdir ~/Mackup
cd ~/Mackup
[ -d backup_${DIR} ] || mkdir backup_${DIR}
cd backup_${DIR}

get_mackup_resources() {
  git clone https://github.com/lra/mackup
  mv mackup/mackup/applications .
  rm -fr mackup 
  for d in applications/*.cfg ; do
    cat $d | sed -r '/^\s*$/d' | \
             sed -r '/^\[/d' | \
             sed -r '/^name/d' | \
             sed -r '/^#/d' >> apps.txt
  done
  rm -fr applications
  cat apps.txt | sort > apps_sorted.txt
}

get_local_resources() {
  for d in ~/.mackup/*.cfg ; do
    cat $d | sed -r '/^\s*$/d' | \
             sed -r '/^\[/d' | \
             sed -r '/^name/d' | \
             sed -r '/^#/d' | \
             sed -r '/^\//d' >> apps.txt
  done
  cat apps.txt | sort > apps_sorted.txt
}

get_local_system_resources() {
  for d in ~/.mackup/*.cfg ; do
    cat $d | sed -r '/^\//!d' >> system.txt
  done
  cat system.txt | sort > system_sorted.txt
}

# copy user files
get_mackup_resources
get_local_resources
[ -d user ] || mkdir user
rsync -aLkru ~/ \
 --files-from=apps_sorted.txt \
 --ignore-errors \
 user/

# copy system files
get_local_system_resources
[ -d system ] || mkdir system
rsync -aLkru / \
  --files-from=system_sorted.txt \
  --ignore-errors \
  system/

# vscode extensions
# https://github.com/lra/mackup/issues/1606#issuecomment-664344070
# https://stackoverflow.com/questions/35773299/how-can-you-export-the-visual-studio-code-extension-list
code --list-extensions > vscode_extensions_list.txt;

