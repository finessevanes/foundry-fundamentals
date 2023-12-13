## Foundry

Ethereum application development toolkit written in Rust.

- ➕ Tests are written in Solidity
- ➕ Super fast at executing tests and scripts

## SimpleStorage

- [Local Deployment with Anvil](#local-deployment-with-anvil)
- [Deploying to the Sepolia Network](#deploying-to-the-sepolia-network)
- [Interacting with a Smart Contract via CLI](#interacting-with-a-smart-contract-via-cli)

### Local Deployment with Anvil

Anvil is a local Ethereum node used for testing and development.

#### Steps:
1. **Run Anvil**: Open a terminal and start Anvil with `anvil`. You'll see a list of available public and private keys. Copy a private key for use.
2. **Deploy SimpleStorage**: Open another terminal and deploy the contract with:
   ```bash
   forge create SimpleStorage --private-key PRIVATE_KEY
   ```
   Replace `PRIVATE_KEY` with the copied key.

#### Expected Output:
Your terminal should display deployment details including the deployer address, deployed contract address, and transaction hash.

Expected output:
```bash
[⠢] Compiling...
No files changed, compilation skipped
Deployer: 0xf39Fd6e51aad88F6F4ce6aB8827279cffFb92266
Deployed to: 0x5FbDB2315678afecb367f032d93F642f64180aa3
Transaction hash: 0x67768b2ea725d5ff63e3d82e587fbe8cf9b3b7121964850b2c18158c22f02510
```

### Deploying to the Sepolia Network

#### Prerequisites:
1. **Alchemy Account**: If you don't have one, sign up at Alchemy and create a new app for the Ethereum chain on the Sepolia network.
2. **MetaMask Setup**: In MetaMask, switch to the Sepolia Network and note your private key.

#### Deployment Steps:
1. **Environment Setup**: In your project directory, create an `.env` file:
   ```bash
   touch .env
   ```
   Add the following lines:
   ```env
   SEPOLIA_RPC_URL=https://eth-mainnet.g.alchemy.com/v2/YOUR_ALCHEMY_KEY
   SEPOLIA_PRIVATE_KEY=YOUR_METAMASK_PRIVATE_KEY
   ```
   Replace `YOUR_ALCHEMY_KEY` and `YOUR_METAMASK_PRIVATE_KEY` with your respective keys.

2. **Deploy Contract**: Execute the deployment command:
   ```bash
   forge create src/SimpleStorage.sol:SimpleStorage --private-key $SEPOLIA_PRIVATE_KEY --rpc-url $SEPOLIA_RPC_URL
   ```

#### Post-Deployment:
- **Verify Transaction**: Use the transaction hash to verify the transaction on Sepolia Etherscan.

```bash
[⠢] Compiling...
No files changed, compilation skipped
Deployer: 0x78d2112d5a619858259C05b846983aAB66B11d23
Deployed to: 0x638CB94BFb6dc4083276FCCDa824a74cf376dd79
Transaction hash: 0xff0f11b05239c0fb2cee7220d3347eab15382a540c87672d3e8a097e4035260b
```

Etherscan URL: [https://sepolia.etherscan.io/tx/TRANSACTION_HASH](https://sepolia.etherscan.io/tx/0xff0f11b05239c0fb2cee7220d3347eab15382a540c87672d3e8a097e4035260b)

### Interacting with a Smart Contract via CLI

To interact with a smart contract from the command line, use the `cast send` command. This allows you to call functions on the contract and send transactions to it. The general format for the command is as follows:

```bash
cast send [CONTRACT_ADDRESS] "[FUNCTION_SIGNATURE]" [ARGUMENTS] --rpc-url $RPC_URL --private-key $PRIVATE_KEY
```

Where:
- `[CONTRACT_ADDRESS]` is the address of the contract.
- `[FUNCTION_SIGNATURE]` is the function in the contract you want to call, along with its parameter types.
- `[ARGUMENTS]` are the values you're passing to the function.
- `$RPC_URL` is your Ethereum node's RPC URL.
- `$PRIVATE_KEY` is your private key for signing the transaction.

For example, to call a function `functionName` taking two string arguments on a contract, you would use:

```bash
cast send 0x6c4791c3a9E9Bc5449045872Bd1b602d6385E3E1 "functionName(string,string)" "string 1" "string 2" --rpc-url $SEPOLIA_RPC_URL --private-key $SEPOLIA_PRIVATE_KEY
```

Replace the contract address, function name, and arguments with the relevant details for your specific use case.

## Cheatsheet

- build: `forge build`
- test: `forge test`
- format: `forge fmt`
- gas snapshots: `forge snapshot`
- anvil: `anvil`
- deploy: `forge create ContractName --rpc-url $RPC_URL --private-key $PRIVATE_KEY`
- deploy with script: `forge script script/ContractName.s.sol:ContractName --rpc-url $RPC_URL --private-key $PRIVATE_KEY`
- [forge, anvil, case]: `--help`

## Documentation

https://book.getfoundry.sh/

## Final Challenge

https://sepolia.etherscan.io/address/0x6c4791c3a9E9Bc5449045872Bd1b602d6385E3E1#code
