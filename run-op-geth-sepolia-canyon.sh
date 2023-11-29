# https://oplabs.notion.site/Canyon-node-protocol-version-upgrade-guide-d2cd8205f9ff4326bdc4b3c4d39fb6ec
# https://github.com/ethereum-optimism/optimism/releases/tag/op-node%2Fv1.3.0

SEQUENCER_URL="https://sepolia-sequencer.optimism.io/"

DATADIR="$(pwd)/data-op-geth-sepolia-canyon"
JWT_TOKEN=$(pwd)/jwt.txt
HTTP_PORT=28545
WS_PORT=28546
AUTHRPC_PORT=28551
# Default is 30303
PORT=30306
DISCOVERY_PORT=30305

cd ../op-geth-1.3.0

./build/bin/geth \
        --datadir=${DATADIR} \
        --http \
        --http.corsdomain="*" \
        --http.vhosts="*" \
        --http.addr 0.0.0.0 \
        --http.port ${HTTP_PORT} \
        --http.api web3,debug,eth,txpool,net,engine \
        --ws \
        --ws.addr "0.0.0.0" \
        --ws.port ${WS_PORT} \
        --ws.origins="*" \
        --ws.api=debug,eth,txpool,net,engine \
        --authrpc.vhosts="*" \
        --authrpc.addr "0.0.0.0" \
        --authrpc.port ${AUTHRPC_PORT} \
        --authrpc.jwtsecret=${JWT_TOKEN} \
        --syncmode=full \
        --op-network=op-sepolia \
        --rollup.halt=major \
        --gcmode=archive \
        --nodiscover \
        --maxpeers=0 \
        --rollup.sequencerhttp=$SEQUENCER_URL \
        --port=${PORT} \
        --discovery.port=${DISCOVERY_PORT} \
        --rollup.disabletxpoolgossip=true
