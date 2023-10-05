SEQUENCER_URL=https://sepolia-sequencer.optimism.io/

cd ../../op-geth

./build/bin/geth \
	--datadir=$(pwd)/data-op-geth-sepolia \
	--http \
	--nodiscover \
	--http.port=8545 \
	--http.addr=localhost \
	--http.api eth,web3,net,txpool,debug,engine \
	--ws --ws.api eth,web3,net,txpool \
	--authrpc.addr=localhost \
	--authrpc.jwtsecret=./jwt.txt \
	--verbosity=5 \
	--rollup.sequencerhttp=$SEQUENCER_URL \
	--syncmode=full \
	--maxpeers=0
