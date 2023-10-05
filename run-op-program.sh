#!/usr/bin/env bash
set -euo pipefail

make op-program

L1RPC=http://localhost:19545
L2RPC=http://localhost:8545

# L2 output oracle on Goerli
# L2_OUTPUT_ORACLE=0xE6Dfba0953616Bacab0c9A8ecb3a9BBa77FC15c0
# L2 output oracle on Sepolia
L2_OUTPUT_ORACLE=0x90E9c4f8a994a250F6aEfd61CAFb4F2e895D458F

L2_FINALIZED_NUMBER=$(cast block finalized --rpc-url "${L2RPC}" -f number)
echo "Finalize number: ${L2_FINALIZED_NUMBER}"
L2_FINALIZED_HASH=$(cast block "${L2_FINALIZED_NUMBER}" --rpc-url "${L2RPC}" -f hash)

L1_FINALIZED_NUMBER=$(cast block finalized --rpc-url "${L1RPC}" -f number)
L1_FINALIZED_HASH=$(cast block "${L1_FINALIZED_NUMBER}" --rpc-url "${L1RPC}" -f hash)

OUTPUT_INDEX=$(cast call --rpc-url "${L1RPC}" "${L2_OUTPUT_ORACLE}" 'getL2OutputIndexAfter(uint256) returns(uint256)' "${L2_FINALIZED_NUMBER}")
OUTPUT_INDEX=$((OUTPUT_INDEX-1))

OUTPUT=$(cast call --rpc-url "${L1RPC}" "${L2_OUTPUT_ORACLE}" 'getL2Output(uint256) returns(bytes32,uint128,uint128)' "${OUTPUT_INDEX}")
OUTPUT_ROOT=$(echo ${OUTPUT} | cut -d' ' -f 1)
OUTPUT_TIMESTAMP=$(echo ${OUTPUT} | cut -d' ' -f 2)
OUTPUT_L2BLOCK_NUMBER=$(echo ${OUTPUT} | cut -d' ' -f 3)

L1_HEAD=$L1_FINALIZED_HASH
L2_CLAIM=$OUTPUT_ROOT
L2_BLOCK_NUMBER=$OUTPUT_L2BLOCK_NUMBER

STARTING_L2BLOCK_NUMBER=$((L2_BLOCK_NUMBER-100))
STARTING_OUTPUT_INDEX=$(cast call --rpc-url "${L1RPC}" "${L2_OUTPUT_ORACLE}" 'getL2OutputIndexAfter(uint256) returns(uint256)' "${STARTING_L2BLOCK_NUMBER}")
STARTING_OUTPUT=$(cast call --rpc-url "${L1RPC}" "${L2_OUTPUT_ORACLE}" 'getL2Output(uint256) returns(bytes32,uint128,uint128)' "${STARTING_OUTPUT_INDEX}")
STARTING_OUTPUT_ROOT=$(echo ${OUTPUT} | cut -d' ' -f 1)
L2_HEAD_NUMBER=$(echo ${OUTPUT} | cut -d' ' -f 3)
L2_HEAD=$(cast block "${L2_HEAD_NUMBER}" --rpc-url "${L2RPC}" -f hash)

set -x
./op-program/bin/op-program \
	--log.level DEBUG \
	--l1 $L1RPC \
	--l2 $L2RPC \
	--network sepolia \
	--datadir $(pwd)/op-program-db-sepolia \
	--l1.head $L1_HEAD \
	--l2.head $L2_HEAD \
	--l2.outputroot $STARTING_OUTPUT_ROOT \
	--l2.claim $L2_CLAIM \
	--l2.blocknumber $L2_BLOCK_NUMBER
