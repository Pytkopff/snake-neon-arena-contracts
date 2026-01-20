// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

/**
 * @title ArenaPass
 * @dev Simple access control for Season 1 premium content.
 */
contract ArenaPass {
    string public constant SEASON_NAME = "Neon Genesis";
    uint256 public totalPassesIssued;
    
    // Kto posiada przepustkę?
    mapping(address => bool) public hasPass;

    event PassMinted(address indexed player);

    // Symulacja zakupu/odbioru przepustki
    function claimPass() public {
        require(!hasPass[msg.sender], "Pass already claimed");
        hasPass[msg.sender] = true;
        totalPassesIssued++;
        emit PassMinted(msg.sender);
    }

    // Funkcja dla frontendu gry do sprawdzania dostępu
    function checkAccess(address _player) public view returns (bool) {
        return hasPass[_player];
    }
}
