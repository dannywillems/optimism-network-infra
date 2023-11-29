LISTENING_ADDR="0.0.0.0"
LISTENING_PORT=30304
AUTHRPC_PORT=19551
HTTP_PORT=19551
WS_PORT=19551

DATADIR=$(pwd)/data-geth-sepolia

geth \
	--http \
	--sepolia \
	--http.api eth,web3,net,txpool,debug,engine \
	--ws \
  --ws.api eth,web3,net,txpool \
	--authrpc.jwtsecret=$(pwd)/jwt.txt \
	--port ${LISTENING_PORT} \
	--authrpc.port ${AUTHRPC_PORT} \
  --authrpc.addr ${LISTENING_ADDR} \
	--http.port ${HTTP_PORT} \
  --http.addr ${LISTENING_ADDR} \
	--ws.port ${WS_PORT} \
  --ws.addr ${LISTENING_ADDR} \
	--verbosity 3 \
	--syncmode full \
	--datadir=${DATADIR} \
	--metrics
