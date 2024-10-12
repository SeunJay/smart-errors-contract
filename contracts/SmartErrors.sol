// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.27;

// Uncomment this line to use console.log
// import "hardhat/console.sol";

contract SmartErrors {
    uint256 public storedValue;
    address public owner;

    // Constructor: Sets the initial owner of the contract
    constructor(uint256 _initialValue) {
        owner = msg.sender;
        storedValue = _initialValue;
    }

    // Modifier to restrict access to the contract owner
    modifier onlyOwner() {
        require(msg.sender == owner, "Access denied: Only owner can call this function");
        _;
    }

    // Function to update stored value with a require check
    function updateValue(uint256 newValue) public onlyOwner {
        // Require statement checks a condition and throws if it's false
        require(newValue > 0, "New value must be greater than zero");

        // Update the stored value
        storedValue = newValue;

    }

     function getStoredValue() public view onlyOwner returns(uint) {
        return storedValue;
    }

    // Function that uses assert to check an invariant
    function checkInvariant() public view returns (bool) {
        // Assert is used for internal errors and should never fail if logic is correct
        assert(storedValue > 0);

        return true; // If this returns true, the invariant holds
    }

    // Function to demonstrate revert with a custom error message
    function revertExample(uint256 input) public pure {
        // Revert is used to manually trigger an error and rollback changes
        if (input > 10) {
            revert("Input value is too high: must be 10 or less");
        }
    }

    // Function to transfer ownership with require check
    function transferOwnership(address newOwner) public onlyOwner {
        require(newOwner != address(0), "New owner cannot be the zero address");
        owner = newOwner;
    }
}