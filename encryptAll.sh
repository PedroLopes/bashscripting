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
FILES=`find . -type f -not -name '*gpg' -not -name '*sh'`
echo "$FILES"
for f in $FILES
do
 echo "Processing $f"
 #gpg -c $f
 gpg --batch --yes --passphrase "$mypassword" -c $f
done
#--------------------------------
read -p "Remove files?" -n 1 -r
if [[ $REPLY =~ ^[Yy]$ ]]
then
    echo "------"
    read -p "Are you sure THE SOURCES (yes/anything else)? Remove?" 
    if [[ $REPLY =~ ^[Yy]$ ]]
    then
    	find . -type f -not -name '*gpg' -not -name '*sh' | xargs rm
    fi
fi
#--------------------------------
