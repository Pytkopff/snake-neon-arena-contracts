// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract GameConfig {
    address public admin;
    bool public gamePaused;
    uint256 public maxPlayersPerRoom = 10;

    event ConfigUpdated(string param, uint256 value);

    constructor() {
        admin = msg.sender;
    }

    modifier onlyAdmin() {
        require(msg.sender == admin, "Only admin can call this");
        _;
    }

    function setPaused(bool _paused) external onlyAdmin {
        gamePaused = _paused;
    }

    function setMaxPlayers(uint256 _max) external onlyAdmin {
        maxPlayersPerRoom = _max;
        emit ConfigUpdated("maxPlayers", _max);
    }
}
