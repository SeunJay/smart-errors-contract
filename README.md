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
    uint256 public storedValue;
    address public owner;

    constructor(uint256 _initialValue) {
        owner = msg.sender;
        storedValue = _initialValue;
    }

    modifier onlyOwner() {
        require(msg.sender == owner, "Access denied: Only owner can call this function");
        _;
    }

    function updateStoredValue(uint256 newValue) public onlyOwner {
        require(newValue > 0, "New value must be greater than zero");

        storedValue = newValue;

    }

     function getStoredValue() public view onlyOwner returns(uint) {
        return storedValue;
    }

    function isStoredValuePositive() public view returns (bool) {
        assert(storedValue > 0);

        return true;
    }

    function isAboveThreshold(uint256 input) public pure {
        if (input > 10) {
            revert("Input value is too high: must be 10 or less");
        }
    }
}


```

To compile the code, click on the "Solidity Compiler" tab in the left-hand sidebar. Make sure the "Compiler" option is set to "0.8.0" (or another compatible version), and then click on the "SmartErrors.sol" button.

Once the code is compiled, you can deploy the contract by clicking on the "Deploy & Run Transactions" tab in the left-hand sidebar. Select the "SmartErrors" contract from the dropdown menu, and then click on the "Deploy" button.

## Author

Oluwaseun Jayeoba

## Loom(video) walkthrough

```bash
https://www.loom.com/share/1a88428ad6024f32ab3af3353e9458b7
```

## License

This project is licensed under the MIT License
