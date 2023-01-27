#!/bin/sh
BASEDIR=${1:-/home/ebeling/GitHub}
echo "Updating all trunk below $BASEDIR"
find $BASEDIR -name .trunk -execdir trunk upgrade \;
find $BASEDIR -name trunk.yaml -exec sed 's/black@22.12.0/black@23.1a1/' --in-place \{\} + -execdir trunk install \;
#find $BASEDIR -name trunk.yaml -exec grep black \{\} \;
find $BASEDIR -name .trunk -execdir trunk check --all \;
find $BASEDIR -name .trunk -execdir trunk actions enable trunk-fmt-pre-commit trunk-check-pre-push \;
