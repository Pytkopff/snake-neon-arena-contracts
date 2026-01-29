
// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;

/**
 * @title Neon Guestbook Protocol
 * @author Pytkopff
 * @notice A lightweight, decentralized messaging board for the Base ecosystem.
 */
contract NeonGuestbook {
    
    address public immutable i_owner;

    event NewSignature(address indexed signer, string message, uint256 tipAmount, uint256 timestamp);
    
    error NeonGuestbook__OnlyOwner();
    error NeonGuestbook__TransferFailed();

    modifier onlyOwner() {
        if (msg.sender != i_owner) revert NeonGuestbook__OnlyOwner();
        _;
    }

    constructor() {
        i_owner = msg.sender;
    }

    // To jest funkcja, która zarabia (PAYABLE)
    function signGuestbook(string calldata _message) external payable {
        emit NewSignature(msg.sender, _message, msg.value, block.timestamp);
    }

    // To jest funkcja do wypłaty środków do Ciebie
    function withdrawFees() external onlyOwner {
        uint256 balance = address(this).balance;
        (bool success, ) = payable(i_owner).call{value: balance}("");
        if (!success) revert NeonGuestbook__TransferFailed();
    }
}
