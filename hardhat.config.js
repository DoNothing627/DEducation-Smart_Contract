require("@nomicfoundation/hardhat-toolbox");
require("@nomicfoundation/hardhat-chai-matchers");
require("@nomiclabs/hardhat-ethers");
require("@nomiclabs/hardhat-etherscan");

const secret = require("./secret.json");

/** @type import('hardhat/config').HardhatUserConfig */
module.exports = {
  solidity: "0.8.17",
  networks: {
    goerli: {
      url: secret.url, // endpoint alchemy
      accounts: [secret.private_key], // private key metamask wallet
    },
  },
  etherscan: {
    apiKey: {
      goerli: secret.etherscanApiKey, // api key alchemy
    },
  },
};
