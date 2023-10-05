L1URL=http://localhost:19545
L1KIND=debug_geth
NET=sepolia

JWT_FILE=$(pwd)/jwt.txt

cd ../../optimism/op-node

./bin/op-node \
    --l1=$L1URL  \
    --l1.rpckind=$L1KIND \
    # https://github.com/ethereum-optimism/optimism/issues/4821#issuecomment-1412515497
    --l2=http://localhost:8551 \
    --l2.jwt-secret=${JWT_FILE} \
    --network=$NET \
    --rpc.addr=localhost \
    --rpc.port=18551


