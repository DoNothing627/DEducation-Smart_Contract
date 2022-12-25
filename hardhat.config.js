require("@nomicfoundation/hardhat-toolbox");

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
};
