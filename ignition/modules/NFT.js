const { buildModule } = require("@nomicfoundation/hardhat-ignition/modules");

module.exports = buildModule("NFTModule", (m) => {
  const owner = m.getAccount(0);
  const nft = m.contract("NFT", [owner]);
  return { nft };
});
