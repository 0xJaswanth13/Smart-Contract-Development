// SPDX-License-Identifier: MIT
pragma solidity 0.8.24;
contract FundMe {
uint256 public value =1;
function fund() public payable {

    value = value + 2; // If require(msg.value > 1e18); get's success then we will add 1+2 or else we will get 1
    require(msg.value > 1e18); // 1e18 = 1 ETH = 1 * 10 ** 18 = 1000000000000000000
}
// function withdraw() public {}


}