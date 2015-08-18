#!/bin/bash
dropbox_exec="/Applications/Dropbox.app/Contents/MacOS/Dropbox"

usage="$(basename "$0") [-h] [-r] [-a] [-s] -- encrypts files stored on dropbox (kills dropbox process)
-h  show this help text
-r  restarts dropbox after command one (not default)
-a  executes encrypt on all files of this directory (not default)
-s  execute everything in silent mode"
#--------------------------------
verbose_on="1" #means true
_print() 
{ 
    [ "${verbose_on}" -ne "0" ] && $@ 
} 
#--------------------------------
encrypt_all_files=false
restart_dropbox=false
while getopts 'sahr' option; do
  case "$option" in
    s) verbose_on="0" #verbose goes off
       ;;
    a) encrypt_all_files=true
       _print echo "Will do this for all files in this DIR."
       ;;
    h) echo "$usage"
       exit
       ;;
    r) _print echo "Will start Dropbox after commands are done"
       restart_dropbox=true
       ;;
   \?) printf "illegal options." >&2
       echo "$usage" >&2
       exit 1
       ;;
  esac
done
shift $((OPTIND - 1))
#--------------------------------
if [[ $encrypt_all_files = true ]]
    then #decrypt all files from this folder
      read -s -p "Enter Password: " mypassword
      echo "Again..."
      read -s -p "Enter Password: " mypasswordz
      if [[ $mypassword = $mypasswordz ]]
          then
              echo "Passwords match. Proceeding."
          else
              echo "Passwords do not match. Sorry. "
          	exit
          fi
      #--------------------------------
      FILES=`find * -type f -not -name '*gpg' -not -name '*sh'`
      echo "$FILES"
      for f in $FILES
      do
       echo "Processing $f"
       #gpg -c $f
       gpg --batch --yes --passphrase "$mypassword" -c $f
      done
      #--------------------------------
      read -p "Remove files [Yy]?" -n 1 -r
      if [[ $REPLY =~ ^[Yy]$ ]]
      then
          	find * -type f -not -name '*gpg' -not -name '*sh' | xargs rm
      fi
    else
      #decrypt a single file
        gpg -c "$1" #beware with files with spaces 
        #--------------------------------
        read -p "Remove files? [Yy]" -n 1 -r
        if [[ $REPLY =~ ^[Yy]$ ]]
        then
                find * -name "$1" | xargs rm
        fi
fi
#--------------------------------
if [[ $restart_dropbox = true ]]
  then
    echo "Restarting Dropbox"
    $dropbox_exec & 
fi