#!/bin/sh

#this takes in a file and if that file contains a date in the format YYYY-MM-DD, then it renames that file to just the date and a timestamp of creation date. It uses a python file of the same name. 

for f in *
do
 echo "Processing $f" # always double quote "$f" filename
 new_name=`python3 screenshot-renamer.py "$f"`
 echo $new_name
 if [ "$new_name" != "None" ]; then
    echo "\tWill change from $f to $new_name"
    mv "$f" "$new_name"
 fi
done
