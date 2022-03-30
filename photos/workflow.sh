#!/usr/bin/env bash

# exiftool
# https://gist.github.com/dnozay/955037f077b6dec87aa9b1eb552caf8d
# https://gist.github.com/rjames86/33b9af12548adf091a26

export FIGNORE="$FIGNORE:DS_Store"

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

# check for fdupes and run
# if has_program "fdupes"; then
#     echo "Running fdupes..."
#     fdupes -rd $SEARCHPATH
#     #yes 2 | fdupes -rd $SEARCHPATH
# fi

# run exiftool for each file in the folder
# && has_program "exiv2"
if has_program "exiftool"; then
    echo "Rename content..."
    find $SEARCHPATH -type f \( -iname '*' ! -name '.DS_Store' \) -print0 -maxdepth 1 | while IFS= read -r -d '' location; do 
        # filename=$(basename -- "$location")
        parentdir="$(dirname "$location")"
        extension="${location##*.}"
        lowerextension="${extension,,}"
        filename="${location%.*}"
        basefilename="$(basename -- "$filename")"

        echo $location

        # echo "SEARCH"
        # echo $location
        # echo $parentdir
        # echo $lowerextension
        # echo $filename
        # echo $basefilename

        # we handle searching for metadata separately below
        if [[ "$lowerextension" == "aae" ]]; then
            echo "INVALID FILE, SKIP"
            continue;
        fi

        # check if valid date format already, if so, skip
        if [[ $basefilename =~ ^[0-9]{4}-[0-9]{2}-[0-9]{2}\ [0-9]{2}\.[0-9]{2}\.[0-9]{2}(-[0-9]+)?$ ]]; then
            echo "CORRECT FORMAT, SKIP"
            continue;
        fi

        # OIFS=$IFS; IFS=': '
        # set -- $(exiv2 -g Exif.Image.DateTime -Pv "$location")
        # IFS=$OIFS;
        # date1="$1-$2-$3 $4.$5.$6"
        # # date1="$(exiv2 -g Exif.Image.DateTime -Pv "$location")"
        # echo $date1

        date2="$(exiftool -CreateDate -d '%Y-%m-%d %H.%M.%S' -S -s "$location")"
        # echo $date2

        if [[ -z $date2 || $date2 == "" ]]; then
            echo "CAN'T FIND DATE, SKIP"
            continue;
        fi

        # date3="$(exiftool -DateTimeOriginal -d '%Y-%m-%d %H.%M.%S' -S -s "$location")"
        # echo $date3

        newdir=$parentdir
        newname=$date2
        newext=$lowerextension

        if [[ -e "$newdir/$newname.$newext" || -L "$newdir/$newname.$newext" ]]; then
            # echo "FIND NEW NAME"
            i=1
            while [[ -e "$newdir/$newname-$i.$newext" || -L "$newdir/$newname-$i.$newext" ]] ; do
                let i++
            done
            newname=$newname-$i
            # echo "NEW NAME"
            # echo $newname
        fi

        # echo "TEST"
        # echo "$filename.AAE"

        if [[ -e "$filename.aae" || -e "$filename.AAE" ]]; then
            # echo "HAS AAE"
            newmetafilename="$newdir/$newname.aae"
            # echo $newmetafilename
            if [[ -e "$filename.aae" ]]; then
                mv "$filename.aae" "$newmetafilename"
            else
                mv "$filename.AAE" "$newmetafilename"
            fi
        fi

        # echo "NEW"
        newfilename="$newdir/$newname.$newext"
        echo $newfilename
        mv "$location" "$newfilename"

        # exit
    done

    # exit 1

    # echo "Build exitfool mapping..."
    # find $SEARCHPATH -type f -iname '*.aae' -print0 -maxdepth 1 | while IFS= read -r -d '' location; do 
    #     # filename=$(basename -- "$location")
    #     extension="${location##*.}"
    #     filename="${location%.*}"
    #     nfilename="${filename//Drive/Drive2}"
    #     rfilename="$(basename -- "$nfilename")"
    #     parentdir="$(dirname "$nfilename")"

    #     echo "SEARCH"
    #     echo $location
    #     echo $filename
    #     echo $nfilename
    #     echo $rfilename
    #     echo $parentdir

    #     find $parentdir -type f -name "$rfilename*" -print0 -maxdepth 1 | while IFS= read -r -d '' file; do
    #         fileext="${file##*.}"

    #         if [[ "$fileext" == "AAE" || "$fileext" == "aae" ]]; then
    #             echo "SKIP"
    #             echo $file
    #             echo $fileext
    #             continue;
    #         fi

    #         echo "FOUND"
    #         echo $file
    #         echo $fileext

    #         # exiftool -CreateDate -FileModifyDate -DateTimeOriginal "$file"
    #         exiftool -CreateDate -FileModifyDate  -d '%Y-%m-%d %H.%M.%S%%-c.%%le' "$file"

    #         exit
    #     done 


    # done

    # exit 1

    # echo "Running exiftool..."
    # find $SEARCHPATH -type f -name '*' -print0 -maxdepth 1 | while IFS= read -r -d '' location; do
    #     #filename="${location##*/}"
    #     exiftool '-FileName<CreateDate' -d '%Y-%m-%d %H.%M.%S%%-c.%%le' "$location"

    #     # exiftool -createdate -filename \
    #     #     -d '%Y-%m-%d %H.%M.%S' \
    #     #     -csv \
    #     #     ~/Dropbox/'Photos from iPhoto'/* |
    #     #     egrep -v '.*,([^,]*),\1'
    #     #

    #     # filename="${fullfile##*/}"
    #     # extension="${filename##*.}"
    #     # filename="${filename%.*}"

    #     # dates=(`exiftool \
    #     #     -CreateDate \
    #     #     -MediaCreateDate \
    #     #     -DateTimeOriginal \
    #     #     -FileModifyDate \
    #     #     -d '%Y-%m-%d %H-%M-%S' \
    #     #     -S -s "$location"`)

    #     # thedate="${dates[0]} ${dates[1]}"

    #     # filename2=$thedate
    #     # path2="$EXPORTDIR/${thedate:0:4}/${thedate:0:7}"


    #     # set -ex
    #     # sudo chown -R $USER ${1:-.}
    #     # find $1 -type f \( -iname "*.jpg" -o -iname "*.png" \) -not -path '*/\.*' -not -path './uploadme/*' | while read -r media
    #     # do
    #     #   read -r date time < <(exiv2 -g Exif.Image.DateTime -Pv "$media" ) || :
    #     #   if test "$date"
    #     #   then
    #     #     IFS=: read -r year month day <<< "$date"
    #     #     dir=uploadme/$year-$month-$day
    #     #   else
    #     #     dir=uploadme/$(stat -c %y "$media" | awk '{print $1}')
    #     #     #echo \# $media NO EXIF... last modification date: $dir
    #     #   fi
    #     #     mkdir "$dir" || true
    #     #     mv -v "$media" "$dir/$(basename $media)"
    #     # done

    #     # find -type d -not -path '*/\.*' -empty -delete


    #     # if [ ! -d "$path2" ];
    #     # then
    #     #     mkdir -p "$path2"
    #     # fi

    #     # if [ ! -f "$path2/$filename2.$extension" ] ;
    #     # then
    #     #     newfile="$path2/$filename2.$extension"
    #     # else
    #     #     i=1
    #     #     until [ ! -f "$path2/$filename2-$i.$extension" ]; do
    #     #         let i+=1
    #     #     done
    #     #     newfile="$path2/$filename2-$i.$extension"
    #     # fi

    #     #     echo -e " < $newfile\033[K"
    #     #     echo -ne "\r\033[3A"

    #     # cp "$fullfile" "$newfile"

    #     # newfile=""
    # done
fi

# check for ruby and run folder script
if has_program "ruby"; then
    echo "Running folders..."
    ruby ./folders.rb $SEARCHPATH
fi
