require("@nomiclabs/hardhat-waffle")
require("hardhat-dependency-compiler")

/** Import your deploy task */
require("./tasks/deploy")

module.exports = {
  solidity: "0.8.4",
  dependencyCompiler: {
    paths: ["@semaphore-protocol/contracts/verifiers/Verifier20.sol"]
  }
};
