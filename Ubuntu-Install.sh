sudo apt-get install git
cd ~/
git clone https://sebastianmeiser/MATor
cd MATor
sudo apt-get install libboost-all-dev
sudo apt-get install glpk-utils
sudo apt-get install cmake
sudo apt-get install libsqlite3-dev
sudo apt-get install golang
mkdir build
cd build
cmake ..
make
cd ../mator-db
export GOPATH="${HOME}/MATor/mator-db/go"
bash installdb.sh
export PATH="${PATH}:$HOME/MATor/build/Release/lib"






