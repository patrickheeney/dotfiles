#!/usr/bin/env bash

read -e -p "Enter the path to the photos folder (~/Desktop/photos): " FILEPATH
# bash4
# -i "~/Desktop/photos" FILEPATH

montage $FILEPATH/*.jpg -geometry 660x -tile 4x $FILEPATH/composite1.jpg
montage $FILEPATH/*.jpg -geometry 660x -tile 2x+15+15 $FILEPATH/composite2.jpg
