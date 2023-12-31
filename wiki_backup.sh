#!/bin/sh
tar zcpfv `(date +"%Y-%m-%d")`-dokuwiki-backup.tar.gz . --exclude='*dokuwiki-backup.tar.gz' --exclude='data/attic' --exclude='data/media_attic' --exclude='data/cache' --exclude='data/index' --exclude='data/locks' --exclude='data/tmp' --exclude='backup.sh';


# Notes
# This is a very minimal wiki backup script for dokuwiki.
# It excludes directories that have old versions of files, cache, etc... as recommneded in the dokuwiki page. 
# This allows the backup to be fully functional and yet smaller size. 
# Note there are much more advanced scripts at https://www.dokuwiki.org/tips:backup_script so please use those if your needs are more advanced. 
