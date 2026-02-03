// SPDX-License-Identifier: MIT
pragma solidity 0.8.24;
import {SimpleStorage} from "./SimpleStorage.sol";

contract StorageFactory {
SimpleStorage public mySimpleStorage; // Contract public Variable
function createSimpleStorageContract() public {
mySimpleStorage = new SimpleStorage(); // Variable referes to Existing SimpleStorage
}
}