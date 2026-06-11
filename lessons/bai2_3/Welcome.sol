// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

// Contract Welcome: a simple contract to demonstrate basic Solidity syntax.
contract Welcome {
    // Public state variable 'greeting' stores a string.
    // 'public' auto-generates a getter function greeting().
    string public greeting;

    // Constructor: called once at deployment.
    // Initializes the greeting variable with the provided value.
    constructor(string memory initialGreeting) {
        greeting = initialGreeting;
    }

    // getGreeting(): explicit function to return the greeting.
    // 'view' means it reads state but does not modify it.
    function getGreeting() public view returns (string memory) {
        return greeting;
    }
}

// ----- Optional version: modify getGreeting() to also return msg.sender -----
//
// Replace the getGreeting() function above with this version:
//
// function getGreeting() public view returns (string memory, address) {
//     return (greeting, msg.sender);
// }
//
// ----- Deployment & Testing on Remix IDE -----
// 1. Go to https://remix.ethereum.org
// 2. Create a new file "Welcome.sol" and paste this code
// 3. In "Solidity Compiler" tab, select compiler 0.8.x, click "Compile Welcome.sol"
// 4. In "Deploy & Run Transactions" tab, choose environment (Remix VM or Injected Provider)
// 5. Enter an initial greeting (e.g. "Hello, Blockchain!") in the deploy field
// 6. Click "Deploy"
// 7. Under "Deployed Contracts", click greeting or getGreeting() to see the result
// 8. For the optional version, the returned tuple includes both greeting and deployer address
