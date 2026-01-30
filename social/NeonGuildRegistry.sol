// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;

contract NeonGuildRegistry {
    address public owner;
    mapping(string => address) public guildOwners;
    event GuildRegistered(string indexed name, address indexed leader);

    constructor() { owner = msg.sender; }

    function registerGuild(string calldata guildName) external payable {
        require(guildOwners[guildName] == address(0), "Name taken");
        guildOwners[guildName] = msg.sender;
        emit GuildRegistered(guildName, msg.sender);
    }

    function withdraw() external {
        require(msg.sender == owner, "Only owner");
        (bool success, ) = payable(owner).call{value: address(this).balance}("");
        require(success, "Transfer failed");
    }
}
