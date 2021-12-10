# MyTestContract

This is a sample upgradeable smart contract for minting NFTs.

Create `.env` file with the following variables (check `.env.example` file):
```
API_URL = "https://eth-ropsten.alchemyapi.io/v2/your-api-key"
MNEMONIC = "your-metamask-seed-phrase"
MINTER = "minter_crypto_wallet_address"
PAUSER = "pauser_crypto_wallet_address"
```

## Building the solution
Refer to https://docs.openzeppelin.com/learn/

1. Run `npm install`
4. Run `npx truffle compile`

## Configure blockchain network
Edit or add blockchain network configuration in `networks` section of `truffle-config.js`

## Deploying the contract
Run `npx truffle migrate --network <network_name>`

## Upgrading the contract
Please refer to https://docs.openzeppelin.com/learn/upgrading-smart-contracts?pref=truffle