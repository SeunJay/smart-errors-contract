// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.27;

// Uncomment this line to use console.log
// import "hardhat/console.sol";

contract SmartErrors {
     uint public balance;
    address public owner;


    // Constructor to set the contract owner
    constructor() {
        owner = msg.sender;
    }

    // Modifier to restrict certain functions to the owner only
    modifier onlyOwner() {
        if (msg.sender != owner) {
            revert("Only the contract owner can perform this action");
        }
        _;
    }

    // Function using 'require' to check conditions before executing the logic
    function deposit(uint amount) public {
        require(amount > 0, "Deposit amount must be greater than zero");
        balance += amount;
    }

    // Function using 'assert' to check for invariants or internal errors
    function withdraw(uint amount) public {
        if (amount > balance) {
            revert("Insufficient balance!");
        }
        balance -= amount;
        assert(balance >= 0); // Ensure balance doesn't go below zero
    }

    // A simple check to simulate an emergency condition
    function checkBalanceStatus() public view {
        assert(balance >= 0); 
    }
}