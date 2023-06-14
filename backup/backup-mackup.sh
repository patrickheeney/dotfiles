#!/bin/bash

#
# Mackup currently symlinks all files in place instead
# of copying to create a backup. This script uses mackup
# to get a list of paths but rsyncs the files instead
#
# https://github.com/lra/mackup/issues/613
# https://github.com/lra/mackup/issues/859
#

SCRIPT_DIR=$( cd -- "$( dirname -- "${BASH_SOURCE[0]}" )" &> /dev/null && pwd )
DIR=$(date +%Y_%m_%d)

# [ -d ~/.mackup ] || mkdir ~/.mackup
# cd ~/.mackup
[ -d $SCRIPT_DIR/../backups ] || mkdir $SCRIPT_DIR/../backups
cd $SCRIPT_DIR/../backups
[ -d mackup_${DIR} ] || mkdir mackup_${DIR}
cd mackup_${DIR}

get_mackup_resources() {
  git clone --depth 1 --branch master https://github.com/lra/mackup
  mv mackup/mackup/applications .
  rm -fr mackup 
  for d in applications/*.cfg ; do
    cat $d | sed -r '/^\[/d' | \
             sed -r '/^name/d' | \
             sed -r '/^#/d' | \
             sed -r '/^\s*$/d' >> apps.txt
  done
  rm -fr applications
  cat apps.txt | sed -r '/^\s*$/d' | sort > apps_sorted.txt
}

get_local_resources() {
  for d in ~/.mackup/*.cfg ; do
    cat $d | sed -r '/^\[/d' | \
             sed -r '/^name/d' | \
             sed -r '/^#/d' | \
             sed -r '/^\//d' | \
             sed -r '/^\s*$/d' >> apps.txt
  done
  cat apps.txt | sed -r '/^\s*$/d' | sort > apps_sorted.txt
}

get_local_system_resources() {
  for d in ~/.mackup/*.cfg ; do
    cat $d | sed -r '/^\//!d' >> system.txt
  done
  cat system.txt | sed -r '/^\s*$/d' | sort > system_sorted.txt
}

# copy user files
echo "Generating mackup apps..."
get_mackup_resources

echo "Generating local apps"
get_local_resources

echo "Sync user files..."
[ -d user ] || mkdir user
rsync -aLkru ~/ \
 --files-from=apps_sorted.txt \
 --ignore-errors \
 --ignore-missing-args \
 user/

# copy system files
echo "Sync system files..."
get_local_system_resources
[ -d system ] || mkdir system
rsync -aLkru / \
  --files-from=system_sorted.txt \
  --ignore-errors \
  --ignore-missing-args \
  system/

# vscode extensions
# https://github.com/lra/mackup/issues/1606#issuecomment-664344070
# https://stackoverflow.com/questions/35773299/how-can-you-export-the-visual-studio-code-extension-list
echo "Generate vscode files..."
code --list-extensions > vscode_extensions_list.txt;
