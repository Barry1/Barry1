#!/bin/sh
BASEDIR=/home/ebeling/GitHub/
find $BASEDIR -name .trunk -execdir trunk upgrade --filter=-black \;
find $BASEDIR -name trunk.yaml -exec sed 's/black@22.12.0/black@23.1a1/' --in-place \{\} + -execdir trunk install \;
find $BASEDIR -name trunk.yaml -exec grep black \{\} \;
find $BASEDIR -name .trunk -exec trunk check --all \;
