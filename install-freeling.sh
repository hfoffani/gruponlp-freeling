
sudo apt-get install -y build-essential automake autoconf libtool
sudo apt-get install -y libboost-regex-dev libicu-dev zlib1g-dev
sudo apt-get install -y libboost-system-dev libboost-program-options-dev libboost-thread-dev

wget https://github.com/TALP-UPC/FreeLing/releases/download/4.0-beta2/FreeLing-4.0-beta2.tar.gz
tar xvf FreeLing-4.0-beta2.tar.gz
cd FreeLing-4.0-beta2
libtoolize; aclocal; autoconf; automake -a

./configure
make
sudo make install

