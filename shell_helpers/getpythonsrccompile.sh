#!/bin/sh
echo preparing environment
sudo apt-get install \
	build-essential \
	gdb \
	lcov \
	libbz2-dev \
	libffi-dev \
	libgdbm-dev \
	liblzma-dev \
	libncurses5-dev \
	libreadline6-dev \
	libsqlite3-dev \
	libssl-dev \
	lzma \
	lzma-dev \
	tk-dev \
	uuid-dev \
	zlib1g-dev
echo Downloading
wget https://www.python.org/ftp/python/3.10.0/Python-3.10.0.tgz
echo Extracting
tar xf Python-3.10.0.tgz
echo Configuring
cd Python-3.10.0 || exit
./configure --enable-optimizations
echo Building
make -j "$(nproc)"
echo Installing
sudo make altinstall
echo Try Running
python3.10 --version
