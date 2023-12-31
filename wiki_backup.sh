#!/bin/sh
tar zcpfv `(date +"%Y-%m-%d")`-dokuwiki-backup.tar.gz . --exclude='*dokuwiki-backup.tar.gz' --exclude='data/attic' --exclude='data/media_attic' --exclude='data/cache' --exclude='data/index' --exclude='data/locks' --exclude='data/tmp' --exclude='backup.sh';
