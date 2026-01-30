// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;

contract SnakeSkinMarketplace {
    address public owner;
    event SkinReserved(address indexed buyer, uint256 skinId, uint256 price);

    constructor() { owner = msg.sender; }

    function reserveSkin(uint256 skinId) external payable {
        require(msg.value > 0, "Price required");
        emit SkinReserved(msg.sender, skinId, msg.value);
    }

    function withdraw() external {
        require(msg.sender == owner, "Only owner");
        (bool success, ) = payable(owner).call{value: address(this).balance}("");
        require(success, "Transfer failed");
    }
}
