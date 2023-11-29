L1URL=http://localhost:19545
L2PORT=28551
RPC_PORT=18552
L1KIND=debug_geth
NET=op-sepolia
LISTENING_ADDR="0.0.0.0"

JWT_FILE=$(pwd)/jwt.txt

cd ../optimism-1.3.0/op-node

./bin/op-node \
    --l1=${L1URL}  \
    --l1.rpckind=${L1KIND} \
    --l2=http://localhost:${L2PORT} \
    --l2.jwt-secret="${JWT_FILE}" \
    --network=${NET} \
    --rollup.load-protocol-versions=true \
    --rpc.addr="${LISTENING_ADDR}" \
    --rpc.port=${RPC_PORT}
