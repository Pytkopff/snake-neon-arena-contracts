// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract NeonSkinsRegistry {
    // Mapowanie: Adres gracza -> ID wybranego skina
    mapping(address => uint256) public currentSkin;
    
    event SkinChanged(address indexed player, uint256 skinId);

    function setSkin(uint256 _skinId) public {
        // Symulacja: ID 0-99 to darmowe skiny
        require(_skinId < 100, "Premium skins not unlocked yet");
        currentSkin[msg.sender] = _skinId;
        emit SkinChanged(msg.sender, _skinId);
    }

    function getPlayerSkin(address _player) public view returns (uint256) {
        return currentSkin[_player];
    }
}
