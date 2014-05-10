echo "Starting all submodules (only needed the first time you got the repo)"
git submodule init
echo "Updating all submodules (only needed the first time you got the repo)"
git submodule update
echo "Pulling all submodules (projects) one by one:"
git submodule foreach git pull origin master
