// migrations/3_upgrade_nft.js
const { upgradeProxy } = require('@openzeppelin/truffle-upgrades');

const MyTestContract = artifacts.require('MyTestContract');
const MyTestContractV2 = artifacts.require('MyTestContractV2');

module.exports = async function (deployer) {
  const existing = await MyTestContract.deployed();
  await upgradeProxy(existing.address, MyTestContractV2, { deployer });
};