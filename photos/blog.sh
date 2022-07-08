#!/usr/bin/env bash

# Prep photos for blog

read -e -p "Enter the path to the photos folder (~/Desktop/photos): " FILEPATH
# bash4
# -i "~/Desktop/photos" FILEPATH

# http://serverfault.com/questions/417252/check-if-directory-exists-using-home-character-in-bash-fails
SEARCHPATH="`eval echo ${FILEPATH//>}`"

echo "Source: $SEARCHPATH"

if [ ! -d "$SEARCHPATH" ]; then
    echo "Source does not exist"
    exit 1
fi

# Print 0, success if the program is installed, 1, error if it is not
# http://stackoverflow.com/questions/592620/how-to-check-if-a-program-exists-from-a-bash-script
has_program() {
  type "$1" > /dev/null 2>&1
  return $?
}

# && has_program "exiv2"
if has_program "exiftool"; then
    echo "Removing metadata..."
    exiftool -all= $SEARCHPATH
else
    echo "exiftool required"
fi

# imagemagick = convert
if has_program "convert"; then
    echo "Resizing photos..."

    # mogrify -resize 50% *.png
    # magic -size 700 
    # convert '*.jpg[700x>]' thumb-700-%03d.jpg
    # find $SEARCHPATH -iname '*.jpg' -exec convert \{} -verbose -set filename:base "%[basename]" -resize 700\> "$SEARCHPATH/%[filename:base].jpg" \;

    find $SEARCHPATH -type f \( -iname '*.jpg' ! -iname '*-new.jpg' ! -iname '*.jpg_original' ! -name '.DS_Store' \) -print0 -maxdepth 1 | while IFS= read -r -d '' location; do 
        echo $location
        convert "${location}" -verbose -set filename:base "%[basename]" -resize 700\> "${SEARCHPATH}/%[filename:base]-new.jpg"
    done

else
    echo "imagemagick required"
fi

#@TODO - rename files to have current date with letters?
