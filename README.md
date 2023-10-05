## Run infra for Sepolia

Optimism
- op-node
- op-geth

Ethereum
- geth
- lighthouse

And the op-program is going to communicate with L1 geth and L2 op-node.

Generate first a JWT token:
```
openssl rand -hex 32 > jwt.txt
```
