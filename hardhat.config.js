require("@nomicfoundation/hardhat-toolbox");

/** @type import('hardhat/config').HardhatUserConfig */
module.exports = {
  solidity: "0.8.27",
  defaultNetwork: "localhost",
  networks: {
    hardhat: {
      accounts: {
        count: 3,
      },
    },
  },
};
