// We require the Hardhat Runtime Environment explicitly here. This is optional
// but useful for running the script in a standalone fashion through `node <script>`.
//
// You can also run a script with `npx hardhat run <script>`. If you do that, Hardhat
// will compile your contracts, add the Hardhat Runtime Environment's members to the
// global scope, and execute the script.
const hre = require("hardhat");

async function main() {
  const Flashloan = await hre.ethers.getContractFactory("Flashloan");
  const flashloan = await Flashloan.deploy("0xC911B590248d127aD18546B186cC6B324e99F02c");

  await flashloan.deployed();
  console.log("Flashloan deployed to:", flashloan.address);
}

main().catch((error) => {
  console.error(error);
  process.exitCode = 1;
}
);