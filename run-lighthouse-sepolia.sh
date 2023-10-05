bin_dir=$HOME/.bin/lighthouse

${bin_dir}/lighthouse bn \
	--network sepolia \
	--http --http-address 127.0.0.1 \
	--builder http://127.0.0.1:19550 \
	--execution-endpoint http://localhost:19551 \
	--execution-jwt $(pwd)/jwt.txt \
	--checkpoint-sync-url https://sepolia.checkpoint-sync.ethpandaops.io \
	--disable-deposit-contract-sync \
	--datadir=$(pwd)/data-lighthouse-sepolia
