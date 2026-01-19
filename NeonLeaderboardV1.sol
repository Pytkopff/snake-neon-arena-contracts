// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

/**
 * @title NeonLeaderboardV1
 * @dev Simple on-chain high score registry for Snake Neon Arena.
 * Optimized for low gas usage on Base.
 */
contract NeonLeaderboardV1 {
    uint256 public highScore;
    address public topPlayer;
    uint256 public totalGamesLogged;

    event NewHighScore(address indexed player, uint256 score);

    function logScore(uint256 _score) public {
        totalGamesLogged++;
        if (_score > highScore) {
            highScore = _score;
            topPlayer = msg.sender;
            emit NewHighScore(msg.sender, _score);
        }
    }
}
