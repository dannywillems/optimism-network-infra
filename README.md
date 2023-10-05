## Run infra for Sepolia

Optimism
- [op-node](https://github.com/ethereum-optimism/optimism/tree/develop/op-node) --> rollup node
- [op-geth](https://github.com/ethereum-optimism/op-geth) --> execution engine for Optimism

Ethereum
- [geth](https://github.com/ethereum/go-ethereum)
- [lighthouse](https://github.com/sigp/lighthouse)

And the op-program is going to communicate with L1 geth and L2 op-node.

Generate first a JWT token:
```
openssl rand -hex 32 > jwt.txt
```
