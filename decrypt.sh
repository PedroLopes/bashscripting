#!/bin/bash
usage="$(basename "$0") [-h] [-d|-n] [-a] [-s] -- decrypts files stored on dropbox (kills dropbox process)
-h  show this help text
-d  kills dropbox if it is running (default)
-n  does not kill dropbox (not default)
-a  executes decrypt on all files of this directory (not default)
-s  execute everything in silent mode"
#--------------------------------
verbose_on="1" #means true
_print() 
{ 
    [ "${verbose_on}" -ne "0" ] && $@ 
} 
#--------------------------------
encrypt_all_files=false
do_not_kill_dropbox=false
while getopts 'sahdn' option; do
  case "$option" in
    s) verbose_on="0" #verbose goes off
       ;;
    a) encrypt_all_files=true
       _print echo "Will do this for all files in this DIR."
       ;;
    h) echo "$usage"
       exit
       ;;
    d) _print echo "Will stop Dropbox"
       kill $(pgrep Dropbox)
       ;;
    n) do_not_kill_dropbox=true
       _print echo "warning: Will NOT stop Dropbox"
       ;; 
   \?) printf "illegal options." >&2
       echo "$usage" >&2
       exit 1
       ;;
  esac
done
shift $((OPTIND - 1))
#--------------------------------
if [[ $do_not_kill_dropbox = false ]]
    then
    _print echo "Stopping Dropbox"
    kill $(pgrep Dropbox)
    if [[ $? == 0 ]]
        then
            _print echo "Dropbox process was killed succuessfully"
        else 
            _print echo "Dropbox process was not killed succuessfully (perhaps not running, see below)"
            ps -A | grep Dropbox
            _print echo "If output above has only one line and says grep Dropbox, dropbox is not running."
    fi
fi
#--------------------------------
if [[ $encrypt_all_files = true ]]
    then #decrypt all files from this folder
        read -s -p "Enter Password: " mypassword
        _print echo "Again..."
        read -s -p "Enter Password: " mypasswordz
        if [[ $mypassword = $mypasswordz ]]
            then
                _print echo "Passwords match. Proceeding."
            else
                _print echo "Passwords do not match. Sorry. "
            exit
        fi
        FILES=`find * -name '*.gpg'`
        echo "$FILES"
        for f in $FILES
        do
         #echo "Processing $f"
         EXT=`echo "$f" | cut -d'.' -f2`
         FILENAME=`echo "$f" | cut -d'.' -f1` 
         _print echo "$FILENAME.$EXT"
         gpg --batch --yes --passphrase "$mypassword" -d -o $FILENAME.$EXT $FILENAME.$EXT.gpg
        done
        #--------------------------------
        read -p "Remove files? [Yy]" -n 1 -r
        if [[ $REPLY =~ ^[Yy]$ ]]
        then
            find * -name '*.gpg' | xargs rm
        fi
    else
        #decrypt a single file
        gpg "$1" #beware with files with spaces
        #--------------------------------
        read -p "Remove files? [Yy]" -n 1 -r
        if [[ $REPLY =~ ^[Yy]$ ]]
        then
            find * -name "$1" | xargs rm
        fi
fi
#--------------------------------
