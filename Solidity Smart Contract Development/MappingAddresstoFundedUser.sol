// SPDX-License-Identifier: MIT
pragma solidity 0.8.24;
import {AggregatorV3Interface} from "https://github.com/smartcontractkit/chainlink-evm/contracts/src/v0.8/shared/interfaces/AggregatorV3Interface.sol";

contract FundMe {
uint256 public minUSD =5e18;
address[] public funders;
mapping(address funder => uint amountFunded) public addressToAmountFunded; // For mapping address of funder. Which means we can able to get address of account the one who funded amount.

function fund() public payable {
    
    // value = value + 2; // If require(msg.value > 1e18); get's success then we will add 1+2 or else we will get 1
    require(getConversionRate(msg.value) >= minUSD, "Or else Don't send Funds"); // 1e18 = 1 ETH = 1 * 10 ** 18 = 1000000000000000000
    funders.push(msg.sender);
    addressToAmountFunded[msg.sender]=addressToAmountFunded[msg.sender]+msg.value;


}
// function withdraw() public {}
function getPrice() public view returns(uint256) {  
    AggregatorV3Interface priceFeed = AggregatorV3Interface(0x694AA1769357215DE4FAC081bf1f309aDC325306);
    (, int256 price, , , ) = priceFeed.latestRoundData();
return uint256(price * 1e10);
// this function results ETH value. For example "2000.00000000"
}
// price defines ETH in terms of USD

function getConversionRate(uint256 ethAmount) public view returns(uint256) {
    uint256 ethPrice = getPrice();
// ethPrice=1000000000000000000, ethAmount=10000000000000000, 1e18=10000000000000000
    uint256 ethAmountInUSD = (ethPrice * ethAmount)/1e18;
    return ethAmountInUSD;
    
}

function getVersion() public view returns (uint256) {
    return AggregatorV3Interface(0x694AA1769357215DE4FAC081bf1f309aDC325306).version();

}


}