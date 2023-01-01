pragma solidity ^0.8.7; 

// SPDX-License-Identifier: MIT-0

contract WarrantCanary {
    // Array of strings to store the names of the different canaries
    string[] private canaries = [
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
      
    // Create canary status mapping
    mapping (uint8 => canary) private status;

    // Constructor to initialize the contract with the canary status mapping
    constructor() {
        for(uint8 i = 0; i < 10; ++i) {
            canary memory c = canary(canaries[i], true, 0);
            status[i] = c;
        }
    }

    // Update status mapping for killed canary
    function killCanary(uint8 canaryID) public {
        require(msg.sender == address(this), "Only the contract deployer can call this function");
        require(canaryID < 10, "Invalid canary id");
        require(status[canaryID].alive, "Canary is already dead");
        status[canaryID].alive = false;
        status[canaryID].blockOfDeath = block.number;
        emit RIP(canaryID, status[canaryID].name);
    }
      
    // Update status mapping for revived canary
    function reviveCanary(uint8 canaryID) public {
        require(msg.sender == address(this), "Only the contract deployer can call this function");
        require(canaryID < 10, "Invalid canary id");
        require(!status[canaryID].alive, "Canary is already alive");
        status[canaryID].alive = true;
        emit REVIVED(canaryID, status[canaryID].name);
    }

    // Return canary status from a mapping
    function getCanaryStatus(uint8 canaryID) view public returns (bool) {
        require(canaryID < 10, "Invalid canary id");
        return status[canaryID].alive;
    }

    // Event to signal that the canary has died
    event RIP(uint8 indexed canaryID, string canaryName);

    // Event to signal that the canary has been revived
    event REVIVED(uint8 indexed canaryID, string canaryName);
}