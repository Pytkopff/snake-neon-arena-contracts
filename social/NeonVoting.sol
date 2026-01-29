// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;

/**
 * @title Neon Governance Voting
 * @author Pytkopff (Snake Neon Arena)
 * @notice Simple on-chain voting mechanism for game roadmap decisions.
 */
contract NeonVoting {
    
    // --- State Variables ---
    address public immutable i_owner;
    
    // Liczniki głosów
    uint256 public votesForPvP;      // Opcja 1: Tryb PvP
    uint256 public votesForTournament; // Opcja 2: Turnieje

    // --- Events ---
    // Eventy są tanie i budują historię on-chain
    event VoteCast(address indexed voter, uint8 option, uint256 amount);

    // --- Errors ---
    error NeonVoting__InvalidOption();
    error NeonVoting__TransferFailed();
    error NeonVoting__OnlyOwner();

    modifier onlyOwner() {
        if (msg.sender != i_owner) revert NeonVoting__OnlyOwner();
        _;
    }

    constructor() {
        i_owner = msg.sender;
    }

    /**
     * @notice Vote for a roadmap feature.
     * @param _option 1 for PvP, 2 for Tournament.
     * @dev Payable to allow "skin in the game" voting (boosts builder earnings).
     */
    function vote(uint8 _option) external payable {
        if (_option == 1) {
            votesForPvP++;
        } else if (_option == 2) {
            votesForTournament++;
        } else {
            revert NeonVoting__InvalidOption();
        }

        // Emitujemy event (to widać na Explorerze jako aktywność)
        emit VoteCast(msg.sender, _option, msg.value);
    }

    /**
     * @notice Withdraws accumulated voting fees to the owner.
     */
    function withdrawFees() external onlyOwner {
        uint256 balance = address(this).balance;
        (bool success, ) = payable(i_owner).call{value: balance}("");
        if (!success) revert NeonVoting__TransferFailed();
    }
    
    // Szybki podgląd wyników
    function getStandings() external view returns (uint256 pvp, uint256 tournament) {
        return (votesForPvP, votesForTournament);
    }
}
