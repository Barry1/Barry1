#!/usr/bin/bash
[ ! $# -eq 2 ] && { echo "Usage: $0 GIST_URL GIT_FOLDER"; exit 1; }
echo "Merging GIST $1 into GIT folder $2"
pushd $2 >/dev/null
git remote add --fetch gisttoimport $1
git merge -m "gist $1 merged into" gisttoimport --allow-unrelated-histories
git push
git remote remove gisttoimport
popd >/dev/null
