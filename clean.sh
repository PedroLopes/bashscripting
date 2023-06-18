#!/bin/sh
# this is intended to run on a crontab every month
# 0 0 1 * * /bin/zsh /Users/pedrolopes/delete-30-days/clean.sh >> /Users/pedrolopes/logs/30-day-deleted.log

# if you want to adapt this to your own machine, change "/Users/pedrolopes/delete-30-days"  and. "/Users/pedrolopes/logs/30-day-deleted.log" to whatever you need. 

for f in /Users/pedrolopes/delete-30-days/* 
do
 #echo "processed, $f, `date`" 
 if [ "$f" != "/Users/pedrolopes/delete-30-days/clean.sh" ]; then
    rm -rf $f
    echo "$f, `date`"
 fi
done
