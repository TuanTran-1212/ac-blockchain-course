// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract VotingEligibility {
    // State variables
    address public owner;
    uint public minAge;

    // Constructor: set owner to deployer, minAge to 18
    constructor() {
        owner = msg.sender;
        minAge = 18;
    }

    // Check if age meets minimum voting requirement
    function checkEligibility(uint age) public view returns (bool) {
        if (age >= minAge) {
            return true;
        } else {
            return false;
        }
    }

    // Owner-only: update the minimum age
    function updateMinAge(uint newMinAge) public {
        require(msg.sender == owner, "Only owner can update minAge");
        minAge = newMinAge;
    }
}
