import { run } from "hardhat";

/**
 * Auto-generated script to verify Snake Neon Arena contracts on Base Mainnet.
 * Purpose: Increasing transparency and developer score.
 */
async function main() {
  const contractAddress = "0x...YOUR_CONTRACT_ADDRESS_HERE"; // Replace with actual address

  console.log("Starting verification process for Snake Neon Arena...");

  try {
    await run("verify:verify", {
      address: contractAddress,
      constructorArguments: [],
    });
    console.log("Successfully verified on BaseScan!");
  } catch (error: any) {
    if (error.message.toLowerCase().includes("already verified")) {
      console.log("Contract is already verified.");
    } else {
      console.log("Verification error:", error);
    }
  }
}

main()
  .then(() => process.exit(0))
  .catch((error) => {
    console.error(error);
    process.exit(1);
  });
