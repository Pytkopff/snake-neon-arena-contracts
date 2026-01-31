// Optimized for Base Gas Fees - Q1 2026 update

/** @type import('hardhat/config').HardhatUserConfig */
module.exports = {
  solidity: "0.8.20",
  networks: {
    base: {
      url: "https://mainnet.base.org",
      chainId: 8453,
    }
  }
};
