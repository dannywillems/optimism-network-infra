SEQUENCER_URL="https://sepolia-sequencer.optimism.io/"

DATA_DIRECTORY=$(pwd)/data-op-geth-sepolia
JWT_TOKEN=$(pwd)/jwt.txt

cd ../../op-geth

./build/bin/geth \
	--datadir=${DATA_DIRECTORY} \
        --http \
	--http.port=8545 \
        --http.corsdomain="*" \
        --http.vhosts="*" \
        --http.addr=localhost \
        --http.api=web3,debug,eth,txpool,net,engine \
        --ws \
        --ws.addr=localhost \
        --ws.port=8546 \
        --ws.origins="*" \
        --ws.api=debug,eth,txpool,net,engine \
        --syncmode=full \
        --gcmode=archive \
        --nodiscover \
        --maxpeers=0 \
        --authrpc.vhosts="*" \
        --authrpc.addr=localhost \
        --authrpc.port=8551 \
        --authrpc.jwtsecret=${JWT_TOKEN} \
	--rollup.sequencerhttp=$SEQUENCER_URL \
        --rollup.disabletxpoolgossip=true
