// SPDX-License-Identifier: MIT
pragma solidity 0.8.24;
import {AggregatorV3Interface} from "https://github.com/smartcontractkit/chainlink-evm/contracts/src/v0.8/shared/interfaces/AggregatorV3Interface.sol";

contract FundMe {
uint256 public minUSD =5;
function fund() public payable {

    // value = value + 2; // If require(msg.value > 1e18); get's success then we will add 1+2 or else we will get 1
    require(msg.value >= minUSD, "Don't send Funds"); // 1e18 = 1 ETH = 1 * 10 ** 18 = 1000000000000000000

}
// function withdraw() public {}
function getPrice() public{}
// Address 0x694AA1769357215DE4FAC081bf1f309aDC325306
// ABI
//AggregatorV3Interface(0x694AA1769357215DE4FAC081bf1f309aDC325306)
function getConversionRate() public {}
function getVersion() public view returns (uint256) {
    return AggregatorV3Interface(0x694AA1769357215DE4FAC081bf1f309aDC325306).version();

}


}