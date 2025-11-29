#!/usr/bin/env bash

# on server side, no need for this next line (comment)
source ./secret_variables.sh

FOLDER_NAME="`(date +"%Y-%m-%d")`-`(basename "$PWD")`-backup.tar.gz"
tar zcpfv $FOLDER_NAME . --exclude='*.tar.gz' --exclude='backup.sh';
mv $FOLDER_NAME ../backup/;
echo $FOLDER_NAME
echo "${links["backup"]}$FOLDER_NAME"
