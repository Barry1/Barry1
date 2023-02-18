#!/bin/sh
BASEDIR=${1:-/home/ebeling/GitHub}
echo "Updating all trunk below $BASEDIR"
find "$BASEDIR" -name .trunk \
	-not -path "*venv*" \
	-print \
	-execdir trunk upgrade \;
echo "Adding numpy to all trunk-pythons (numpy.typing->mypy)"
find ~/.cache/trunk/tools/python -name python3 \
	-print \
	-execdir ./python3 -m pip install --upgrade pip numpy \;
#No longer exception for black needed
#find "$BASEDIR" -name trunk.yaml -exec sed 's/black@22.12.0/black@23.1a1/' --in-place \{\} + -execdir trunk install \;
#find "$BASEDIR" -name trunk.yaml -exec grep black \{\} \;
find "$BASEDIR" -name .trunk \
	-not -path "*venv*" \
	-print \
	-execdir trunk check --all \; \
	-execdir trunk actions enable trunk-fmt-pre-commit trunk-check-pre-push \;
