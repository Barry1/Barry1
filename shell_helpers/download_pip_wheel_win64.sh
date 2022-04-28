#!/usr/bin/sh
download_whl_or_src () {
    echo $1
    python3 -m pip download --quiet --python-version 3.10 --platform win_amd64 --platform none --only-binary=:all: $1
    if [ $? -eq 1 ]
    then
        python3 -m pip download --quiet --no-binary=:all: $1
    fi
}
for x in $@; do
    download_whl_or_src $x
done