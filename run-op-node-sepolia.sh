L1URL=http://localhost:19545
L1KIND=basic
NET=sepolia

cd ../op-node

./bin/op-node \
    --l1=$L1URL  \
    --l1.rpckind=$L1KIND \
    --l2=http://localhost:8551 \
    --l2.jwt-secret=$(pwd)/jwt.txt \
    --network=$NET \
    --rpc.addr=localhost \
    --rpc.port=8545


