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

FILES=`find * -name '*.gpg'`
for f in $FILES
do
 #echo "Processing $f"
 EXT=`echo "$f" | cut -d'.' -f2`
 FILENAME=`echo "$f" | cut -d'.' -f1` 
 echo "$FILENAME.$EXT"
 gpg --batch --yes --passphrase "$mypassword" -d -o $FILENAME.$EXT $FILENAME.$EXT.gpg
done
#--------------------------------
read -p "Remove files?" -n 1 -r
if [[ $REPLY =~ ^[Yy]$ ]]
then
    echo "------"
    read -p "Are you sure? Remove?" -n 1 -r 
    if [[ $REPLY =~ ^[Yy]$ ]]
    then
    	find * -name '*.gpg' | xargs rm
    fi
fi
#--------------------------------
