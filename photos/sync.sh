# #!/bin/bash
# tmp=$(mktemp -d)
# for i in */*
# do
#   #file $i
#   if test -f /mnt/2tb/media/$i
#   then
#     echo /mnt/2tb/media/$i exists

#     echo Checking if $i uploaded
#     if test -f /mnt/2tb/media/$i.uploaded
#     then
#       echo $i uploaded already ... delete probably
#       mv -v $i $tmp
#     fi

#   else
#     echo /mnt/2tb/media/$i does not exist

#     echo Checking if deleted
#     if test "$(git --git-dir /mnt/2tb/media/.git log --oneline -- $i | wc -l)" -gt 0
#     then
#       echo $i almost certainly deleted ... delete probably
#       mv -v $i $tmp
#     else
#       ddir=/mnt/2tb/media/$(dirname $i)
#       if ! test -d "$ddir"
#       then
#         mkdir "$ddir"
#       fi
#       mv $i $ddir
#     fi

#   fi

# done

# echo Deleted images in $tmp
