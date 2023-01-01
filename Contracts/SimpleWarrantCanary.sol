pragma solidity ^0.8.7;

// Description: warrant canary standard implemented in an ethereum contract.
// Credit: https://eips.ethereum.org/EIPS/eip-801#methods
// Credit: https://github.com/canarytail/standard

contract WarrantCanary {
    // State variable to track the canary's status
    bool private alive;

    // State variable to store the last block number at which the canary died
    uint256 private blockOfDeath;

    // Constructor to initialize the contract with the canary alive
    constructor() public {
        alive = true;
    }

    // Function to check if the canary is alive
    function isAlive() public view returns (bool) {
        return alive;
    }

    // Function to get the block the canary died
    function getBlockOfDeath() public view returns (uint256) {
        require(!alive, "Canary is still alive");
        return blockOfDeath;
    }

    // Function to kill the canary and emit the RIP event
    function kill() public {
        // Check that the caller is the contract deployer
        require(msg.sender == address(this), "Only the contract deployer can call this function");
        require(alive, "Canary is already dead");

        alive = false;
        blockOfDeath = block.number;
        emit RIP();
    }

    // Function to revive the canary and emit the REVIVED event
    function revive() public {
        // Check that the caller is the contract deployer
        require(msg.sender == address(this), "Only the contract deployer can call this function");
        require(!alive, "Canary is already alive");

        alive = true;
        emit REVIVED();
    }

    // Event to signal that the canary has died
    event RIP();

    // Event to signal that the canary has been revived
    event REVIVED();
}
