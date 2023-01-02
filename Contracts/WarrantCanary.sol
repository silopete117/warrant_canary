pragma solidity ^0.8.7; 

// SPDX-License-Identifier: MIT-0
// Description: warrant canary standard implemented in an ethereum contract.
// Credit: https://eips.ethereum.org/EIPS/eip-801#methods
// Credit: https://github.com/canarytail/standard

contract WarrantCanary {
    // Array of strings to store the names of the different canaries
    string[] private canaryNames = [
        "WAR", // Warrants
        "GAG", // Gag orders
        "SUBP", // Subpoenas
        "TRAP", // Trap and trace orders
        "CEASE", // Court order to cease operations
        "DURESS", // Coercion, blackmail, or otherwise operating under duress
        "RAID", // Raids with high confidence nothing containing useful data was seized
        "SEIZE", // Raids with low confidence nothing containing useful data was seized
        "XCRED", // Compromised credentials
        "XOPERS" // Compromised operations
    ];

    // Define canary structure
    struct canary {
        string name;
        bool alive;
        uint256 blockOfDeath;
    }

    // Define state variables
    address private owner;

    // Create canary status mapping
    mapping (uint8 => canary) private canaries;

    // Constructor to initialize the contract with the canary status mapping
    constructor() {
        owner = msg.sender;

        for(uint8 i = 0; i < 10; ++i) {
            canary memory c = canary(canaryNames[i], true, 0);
            canaries[i] = c;
        }
    }

    // Update status mapping for killed canary
    function killCanary(uint8 canaryID) public {
        require(msg.sender == owner, "Only the contract deployer can call this function");
        require(canaryID < 10, "Invalid canary id");
        require(canaries[canaryID].alive, "Canary is already dead");
        canaries[canaryID].alive = false;
        canaries[canaryID].blockOfDeath = block.number;
        emit RIP(canaryID, canaries[canaryID].name, canaries[canaryID].blockOfDeath);
    }
      
    // Update status mapping for revived canary
    function reviveCanary(uint8 canaryID) public {
        require(msg.sender == owner, "Only the contract deployer can call this function");
        require(canaryID < 10, "Invalid canary id");
        require(!canaries[canaryID].alive, "Canary is already alive");
        canaries[canaryID].alive = true;
        emit REVIVED(canaryID, canaries[canaryID].name, canaries[canaryID].blockOfDeath);
    }

    // Return canary status from a mapping
    function getCanaryStatus(uint8 canaryID) view public returns (bool) {
        require(canaryID < 10, "Invalid canary id");
        return canaries[canaryID].alive;
    }

    // Return contract owner
    function getOwner() view public returns (address) {
        return owner;
    }

    // Return array of dead canaries
    function getAliveCanaries() view public returns (string[] memory) {
        string[] memory tmpCanaries = new string[](10);
        uint8 count = 0;

        for (uint8 i = 0; i < 10; ++i) {
            if (canaries[i].alive) {
                tmpCanaries[i] = canaries[i].name;
                ++count;
            }
        }

        string[] memory aliveCanaries = new string[](count);
        count = 0;

        for (uint8 i = 0; i < 10; ++i) {
            if (bytes(tmpCanaries[i]).length > 0) {
                aliveCanaries[count] = tmpCanaries[i];
                ++count;
            }
        }
    
        return aliveCanaries;
    }

    // Return array of dead canaries
    function getDeadCanaries() view public returns (string[] memory) {
        string[] memory tmpCanaries = new string[](10);
        uint8 count = 0;

        for (uint8 i = 0; i < 10; ++i) {
            if (!canaries[i].alive) {
                tmpCanaries[i] = canaries[i].name;
                ++count;
            }
        }

        string[] memory deadCanaries = new string[](count);
        count = 0;

        for (uint8 i = 0; i < 10; ++i) {
            if (bytes(tmpCanaries[i]).length > 0) {
                deadCanaries[count] = tmpCanaries[i];
                ++count;
            }
        }
    
        return deadCanaries;
    }

    // Event to signal that the canary has died
    event RIP(uint8 indexed canaryID, string canaryName, uint256 indexed blockNumber);

    // Event to signal that the canary has been revived
    event REVIVED(uint8 indexed canaryID, string canaryName, uint256 indexed blockNumber);
}