// SPDX-License-Identifier: MIT
pragma solidity 0.8.24;
import {SimpleStorage} from "./SimpleStorage.sol";

contract StorageFactory {
SimpleStorage[] public listofSimpleStorageaddress; // Contract public Variable
function createSimpleStorageContract() public {
SimpleStorage newSimpleStorageContract = new SimpleStorage(); // Variable referes to Existing SimpleStorage
listofSimpleStorageaddress.push(newSimpleStorageContract);
}
function fStore(uint256 _ID, uint256 _Number) public {
listofSimpleStorageaddress[_ID].store(_Number); // to call the store function of SimpleStorage contract]

}
function fGet(uint256 _ID) public view returns(uint256){
    return listofSimpleStorageaddress[_ID].retrieve();

}


}