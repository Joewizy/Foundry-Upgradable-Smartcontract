## Foundry Upgradeable Smart Contract
This project demonstrates the concept and functionality of upgradeable smart contracts using Solidity and Foundry, specifically employing the proxy pattern. It showcases how smart contracts can be upgraded and maintained over time through the use of proxy contracts, providing a practical example of this upgradeability mechanism.

## Installation

**To get started install both Git and Foundry**

- [Git](https://git-scm.com/book/en/v2/Getting-Started-Installing-Git): After installation make sure to run *****git --version***** to confirm installation if you see a response like *****git version 2.34.1*****
then it was successful.

- [Foundry](https://getfoundry.sh/): After installation run *****forge --version***** if you see a response like *****forge 0.2.0 (8549aad 2024-08-19T00:21:29.325298874Z)***** then it was successful.

## Clone the repository
```shell
git clone https://github.com/Joewizy/Foundry-Upgradable-Smartcontract
cd Foundry-Upgradable-Smartcontract
forge build
```
## Test

```shell
$ forge test
```
### Test Coverage
```shell
$ forge coverage
```
To view detailed test coverage reports for your contracts
## Usage
### Start a local node
```shell
$ make anvil
```
### Deploy
By default, your local node will be used here. For it to deploy, it must be running in a separate terminal.
```shell
$ make deploy 
```

### Deploy to a Testnet or Mainnet
By default, your local node will be used here. For it to deploy, it must be running in a separate terminal. All this varaibles should be added to your **.env** file. 
1. Setup your environment variables PRIVATE_KEY , ETHERSCAN_API_KEY and SEPOLIA_RPC_URL.
- PRIVATE_KEY: Import your metamask private key. It is recommended you use a wallet with no funds or a burner wallet. Learn how to export private key [HERE](https://support.metamask.io/managing-my-wallet/secret-recovery-phrase-and-private-keys/how-to-export-an-accounts-private-key/)
- SEPOLIA_RPC_URL: This is URL of the sepolia testnet node you're working with. You can get setup with one for free from [Alchemy](https://www.alchemy.com/?a=673c802981)
- ETHERSCAN_API_KEY: for verification of your contract on [Etherscan](https://etherscan.io/). Learn how to get one [HERE](https://docs.etherscan.io/getting-started/viewing-api-usage-statistics)
2. Get ETH testnet tokens by heading over to [faucets.chain.link](https://faucets.chain.link/) and claim some testnet ETH. 
3. Deploy (make deploy = proxy contract and make upgrade = upgradeable contract)
```shell
source .env
make deploy ARGS="--network sepolia"
make upgrade ARGS="--network sepolia"
```
### CAST
You can use ***cast***  to interact with your deployed smart contract on your terminal
```shell
$ cast <contract-address> <function> [params...]
```
for example ***cast call*** to read data on your deployed contract
```shell
cast call 0xc0c980105551a06f25211ac8658cfdd8a98fbb50 "getNumber()" --rpc-url $SEPOLIA_RPC_URL
```
***cast send*** sends transactions to the deployed contract
```shell
cast send 0xc0c980105551a06f25211ac8658cfdd8a98fbb50 "setNumber(uint256)" 7 --rpc-url $SEPOLIA_RPC_URL --private-key $PRIVATE_KEY
```


### Gas Snapshots
You can estimate how much gas things cost by running:

```shell
$ forge snapshot
```
And you'll see an output file called **.gas-snapshot**

### Help

```shell
$ forge --help
$ anvil --help
$ cast --help
```
