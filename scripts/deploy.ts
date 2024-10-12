const hre = require("hardhat");
import { ethers } from "hardhat";

async function main() {
  // Get the contract to deploy
  const SmartErrors = await ethers.getContractFactory("SmartErrors");
  const initialStoredValue = 0;

  const smartErrors = await SmartErrors.deploy(initialStoredValue);

  await smartErrors.deploymentTransaction();
  const address = await smartErrors.getAddress();
  console.log("SmartErrors smart contract deployed to:", address);
}

main()
  .then(() => process.exit(0))
  .catch((error) => {
    console.error(error);
    process.exit(1);
  });
