// SPDX-License-Identifier: MIT
pragma solidity 0.8.24;
import {SimpleStorage} from "./SimpleStorage.sol";
contract AddFiveStorage is SimpleStorage { // Inheritance Concept. AddFiveStorage Contract is taking everything from SimpleStorage Contract
    function store(uint256 _NewNumber) public  override{
        myfavNumber = _NewNumber + 5;

    }
}