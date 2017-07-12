sudo apt-get -y install git
cd ~/
git clone https://sebastianmeiser/MATor
cd MATor
sudo apt-get -y install libboost-all-dev
sudo apt-get -y install glpk-utils
sudo apt-get -y install cmake
sudo apt-get -y install libsqlite3-dev
sudo apt-get -y install golang
mkdir build
cd build
cmake ..
make
cd ../mator-db
export GOPATH="${HOME}/MATor/mator-db/go"
bash installdb.sh
export PATH="${PATH}:$HOME/MATor/build/Release/lib"






