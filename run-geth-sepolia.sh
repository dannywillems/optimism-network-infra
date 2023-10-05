geth \
	--http \
	--sepolia \
	--http.api eth,web3,net,txpool,debug,engine \
	--ws --ws.api eth,web3,net,txpool \
	--authrpc.jwtsecret=jwt.txt \
	--port 30304 \
	--authrpc.port 19551 \
	--http.port 19545 \
	--ws.port 19546 \
	--verbosity 3 \
	--authrpc.addr=localhost \
	--syncmode full \
	--datadir=$(pwd)/data-geth-sepolia \
	--metrics