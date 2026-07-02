// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract Profile {
    // Public state variable: stores the user's name
    // Solidity auto-generates a getter function name() for public variables
    string public name;

    // Public state variable: stores the user's age
    // Solidity auto-generates a getter function age() for public variables
    uint256 public age;

    // Updates both name and age to the provided values
    // _name and _age are function parameters (prefixed with _ by convention)
    function setProfile(string memory _name, uint256 _age) public {
        name = _name;
        age = _age;
    }
}
