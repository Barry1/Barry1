#!/usr/bin/sh
echo "Merging GIST from $1 into GIT folder $2"
cd $2
git remote add --fetch gisttoimport $1 
git merge -m "gist $1 merged into" gisttoimport --allow-unrelated-histories
git push
git remote remove gisttoimport
