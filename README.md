# SmartErrors

This smart contract handles errors gracefully using the require(), assert() and revert() functions

## Description

This program is a simple contract written in Solidity. The contract has 3 function that returns that implements the require(), assert() and revert() statements.

## Getting Started

### Executing program

To run this program, you can use Remix, an online Solidity IDE. To get started, go to the Remix website at https://remix.ethereum.org/.

Once you are on the Remix website, create a new file by clicking on the "+" icon in the left-hand sidebar. Save the file with a .sol extension (e.g., SmartErrors.sol). Copy and paste the following code into the file:

```javascript
// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract SmartErrors {
     uint public balance;
    address public owner;


    constructor() {
        owner = msg.sender;
    }

    modifier onlyOwner() {
        if (msg.sender != owner) {
            revert("Only the contract owner can perform this action");
        }
        _;
    }

   
    function deposit(uint amount) public {
        require(amount > 0, "Deposit amount must be greater than zero");
        balance += amount;
    }

    function withdraw(uint amount) public {
        if (amount > balance) {
            revert("Insufficient balance!");
        }
        balance -= amount;
        assert(balance >= 0);
    }

    function checkBalanceStatus() public view {
        assert(balance >= 0);
    }
}


```

To compile the code, click on the "Solidity Compiler" tab in the left-hand sidebar. Make sure the "Compiler" option is set to "0.8.0" (or another compatible version), and then click on the "SmartErrors.sol" button.

Once the code is compiled, you can deploy the contract by clicking on the "Deploy & Run Transactions" tab in the left-hand sidebar. Select the "SmartErrors" contract from the dropdown menu, and then click on the "Deploy" button.

## Author

Oluwaseun Jayeoba

## Loom(video) walkthrough

```bash
https://www.loom.com/share/cfbdeaf2f93f4fd88b43d9b89e22b1c6
```

## License

This project is licensed under the MIT License
