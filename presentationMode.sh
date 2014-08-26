#!/bin/bash

if [ -z "$1" ]
then
        echo "please run ./presentationMode [start || stop]"
	echo "[start] will kill Dropbox, Flux, Chrome and disable cronjobs"
        echo "[stop] will restart Dropbox, Flux, Chrome and enable all previous cronjobs"
	exit
fi


if [ "$1" = "start" ]
then
	#start 
	echo "Stoppping Dropbox"
	kill $(pgrep Dropbox)

	echo "Stoppping Flux Screen Shader"
	kill $(pgrep Flux)

	echo "Resetting Crontab to Blank, saving current cron to file for backup"
	touch ~/blankcron.txt
	crontab -l > ~/cronbackup.txt
	crontab ~/blankcron.txt

	echo "Killing Chrome"
	ps -A | awk '/Google\ Chrome -psn_0_32526083/ { print $1 } ' | xargs kill -9

fi

if [ "$1" = "stop" ]
then
	#stop
	echo "Populating Crontab to previous backup"
	crontab ~/cronbackup.txt
	
	echo "Starting Dropbox"
	/Applications/Dropbox.app/Contents/MacOS/Dropbox &

	echo "Starting Flux Screen Shader"
	/Applications/Flux.app/Contents/MacOS/Flux &

	echo "Chrome won't start by itself, please do it manually."
fi
