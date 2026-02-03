// SPDX-License-Identifier: MIT
pragma solidity 0.8.18; // Stating Solidity Version
contract SimpleStorage {
   
    uint256 public favNumber; // If no value is given compiler picks 0
    function store(uint256 _favNumber) public {
        favNumber = _favNumber;
    }
    
    function retrieve() public view returns (uint256) {
        return favNumber;
    }
}