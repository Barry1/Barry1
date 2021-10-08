echo Downloading
wget https://www.python.org/ftp/python/3.10.0/Python-3.10.0.tgz
echo Extracting
tar xf Python-3.10.0.tgz
echo Configuring
cd Python-3.10.0
./configure --enable-optimizations
echo Building
make -j `nproc`
echo Installing
sudo make altinstall
echo Try Running
python3.10 --version