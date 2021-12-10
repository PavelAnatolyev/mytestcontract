// migrations/2_deploy_nft.js

require('dotenv').config();
const { MINTER, PAUSER } = process.env;

const PlantNFT = artifacts.require('MyTestContract');

const { deployProxy } = require('@openzeppelin/truffle-upgrades');

module.exports = async function (deployer) {
  await deployProxy(PlantNFT, [MINTER, PAUSER],  { deployer })
};