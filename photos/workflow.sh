#!/usr/bin/env bash

# Print 0, success if the program is installed, 1, error if it is not
# http://stackoverflow.com/questions/592620/how-to-check-if-a-program-exists-from-a-bash-script
has_program() {
  type "$1" > /dev/null 2>&1
  return $?
}

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

# check for rdupes and run
if has_program "fdupes"; then
    echo "Running rdupes..."
    fdupes -rd $SEARCHPATH
    #yes 2 | fdupes -rd $SEARCHPATH
fi

# run exiftool for each file in the folder
if has_program "exiftool"; then
    echo "Running exiftool..."
    find $SEARCHPATH -type f -name '*' -print0 | while IFS= read -r -d '' location; do
        #filename="${location##*/}"
        exiftool '-FileName<CreateDate' -d '%Y-%m-%d %H.%M.%S%%-c.%%le' "$location"

        # exiftool -createdate -filename \
        #     -d '%Y-%m-%d %H.%M.%S' \
        #     -csv \
        #     ~/Dropbox/'Photos from iPhoto'/* |
        #     egrep -v '.*,([^,]*),\1'
        #     
        
        # filename="${fullfile##*/}"
        # extension="${filename##*.}"
        # filename="${filename%.*}"

        # dates=(`exiftool \
        #     -CreateDate \
        #     -MediaCreateDate \
        #     -DateTimeOriginal \
        #     -FileModifyDate \
        #     -d '%Y-%m-%d %H-%M-%S' \
        #     -S -s "$location"`)

        # thedate="${dates[0]} ${dates[1]}" 

        # filename2=$thedate
        # path2="$EXPORTDIR/${thedate:0:4}/${thedate:0:7}"


        # if [ ! -d "$path2" ];
        # then
        #     mkdir -p "$path2"
        # fi

        # if [ ! -f "$path2/$filename2.$extension" ] ; 
        # then
        #     newfile="$path2/$filename2.$extension"
        # else
        #     i=1
        #     until [ ! -f "$path2/$filename2-$i.$extension" ]; do
        #         let i+=1
        #     done
        #     newfile="$path2/$filename2-$i.$extension"
        # fi

        #     echo -e " < $newfile\033[K"
        #     echo -ne "\r\033[3A"

        # cp "$fullfile" "$newfile"

        # newfile=""
    done
fi

# check for ruby and run folder script
if has_program "ruby"; then
    echo "Running folders..."
    ruby ./folders.rb $SEARCHPATH
fi
