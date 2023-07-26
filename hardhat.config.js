require("@nomicfoundation/hardhat-toolbox");
require('dotenv').config();

const FORK_FUJI = true;
const FORK_MAINNET = true;
let forkingData = undefined;

if (FORK_MAINNET) {
  forkingData = {
    url: "https://api.avax.network/ext/bc/C/rpcc",
  };
}
if (FORK_FUJI) {
  forkingData = {
    url: "https://api.avax-test.network/ext/bc/C/rpc",
  };
}

/** @type import('hardhat/config').HardhatUserConfig */
module.exports = {
  solidity: "0.8.18",
  networks: {
    hardhat: {
      gasPrice: 225000000000,
      chainId: !forkingData ? 43112 : undefined, //Only specify a chainId if we are not forking
      forking: forkingData,
    },
    fuji: {
      url: "https://api.avax-test.network/ext/bc/C/rpc",
      gasPrice: 225000000000,
      chainId: 43113,
      accounts: ["ee7e6a74934dc26de71a1cc6cff46c36cdf647128b68adf69497b668bebb11b0"], // we use a .env file to hide our wallets private key
    },
    mainnet: {
      url: "https://api.avax.network/ext/bc/C/rpc",
      gasPrice: 225000000000,
      chainId: 43114,
      accounts: ["ee7e6a74934dc26de71a1cc6cff46c36cdf647128b68adf69497b668bebb11b0"],
    },
  },
  etherscan: {
    apiKey: "TPA6VYF1NVQJJR6G4WZMARNTNGBGX2BY1C", // we use an .env file to hide our Snowtrace API KEY
  },
};
