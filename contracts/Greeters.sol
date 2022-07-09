//SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

import "semaphore-protocol/contracts/interfaces/IVerifier.sol";
import "semaphore-protocol/contracts/base/SemaphoreCore.sol";

contract Greeters is SemaphoreCore {
    event NewGreeting(bytes32 greeting);
    uint256 public greeters;
    IVerifier public verifier;

    constructor(uint256 _greeters, address _verifier) {
        greeters = _greeters;
        verifier = _verifier;
    }

    function greet(
        bytes32 _greeting,
        uint256 _nullifierHash,
        uint256[8] calldata _proof
    ) external {
        _verifyProof(
            _greeting,
            greeters,
            _nullifierHash,
            greeters,
            _proof,
            verifier
        );
        _saveNullifierHash(_nullifierHash);

        emit NewGreeting(_greeting);
    }
}
