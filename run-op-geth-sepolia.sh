SEQUENCER_URL="https://sepolia-sequencer.optimism.io/"

cd ../../op-geth

./build/bin/geth \
	--datadir=$(pwd)/data-op-geth-sepolia \
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
	--networkid=11155420 \
        --syncmode=full \
        --gcmode=archive \
        --nodiscover \
        --maxpeers=0 \
        --authrpc.vhosts="*" \
        --authrpc.addr=localhost \
        --authrpc.port=8551 \
        --authrpc.jwtsecret=./jwt.txt \
	--rollup.sequencerhttp=$SEQUENCER_URL \
        --rollup.disabletxpoolgossip=true
