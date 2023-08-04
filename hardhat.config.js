require("@nomicfoundation/hardhat-toolbox");
require("dotenv").config();

const { DEPLOYER_SIGNER_PRIVATE_KEY, INFURA_PROJECT_ID } = process.env;

/** @type import('hardhat/config').HardhatUserConfig */
module.exports = {
  solidity: "0.8.19",
  networks: {
    sepolia: {
      url: `https://sepolia.infura.io/v3/${INFURA_PROJECT_ID}`,
      accounts: [DEPLOYER_SIGNER_PRIVATE_KEY],
    },
  },
};
