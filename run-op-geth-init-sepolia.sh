DATADIR="$(pwd)/data-op-geth-sepolia"

cd ../op-geth

curl -o genesis.json -sL https://storage.googleapis.com/oplabs-network-data/Sepolia/genesis.json
./build/bin/geth init --datadir=${DATADIR} genesis.json
