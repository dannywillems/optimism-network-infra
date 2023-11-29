SEQUENCER_URL="https://sepolia-sequencer.optimism.io/"

DATADIR=$(pwd)/data-op-geth-sepolia
JWT_TOKEN=$(pwd)/jwt.txt

LISTENING_ADDR="0.0.0.0"
AUTHRPC_PORT=8551
HTTP_PORT=8545
WS_PORT=8546
LISTENING_PORT=30303
DISCOVERY_PORT=30303

cd ../../op-geth

./build/bin/geth \
    --datadir=${DATADIR} \
    --http \
    --http.port=${HTTP_PORT} \
    --http.corsdomain="*" \
    --http.vhosts="*" \
    --http.addr=${LISTENING_ADDR} \
    --http.api=web3,debug,eth,txpool,net,engine \
    --syncmode=full \
    --gcmode=archive \
    --nodiscover \
    --maxpeers=0 \
    --ws \
    --ws.addr=${LISTENING_ADDR} \
    --ws.port=${WS_PORT} \
    --ws.origins="*" \
    --ws.api=debug,eth,txpool,net,engine \
    --authrpc.vhosts="*" \
    --authrpc.addr=${LISTENING_ADDR} \
    --authrpc.port=${AUTHRPC_PORT} \
    --authrpc.jwtsecret=${JWT_TOKEN} \
    --port=${LISTENING_PORT} \
    --discovery.port=${DISCOVERY_PORT} \
    --rollup.sequencerhttp=$SEQUENCER_URL \
    --rollup.disabletxpoolgossip=true
