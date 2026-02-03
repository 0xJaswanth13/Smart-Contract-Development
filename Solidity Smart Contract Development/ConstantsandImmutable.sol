// SPDX-License-Identifier: MIT
pragma solidity 0.8.24;
import {PriceConverter} from "./PriceConverter.sol";
contract FundMe {
uint256 public constant MINUSD =5e18;
using PriceConverter for uint256;
address[] public funders;
mapping(address funder => uint amountFunded) public addressToAmountFunded; // For mapping address of funder. Which means we can able to get address of account the one who funded amount.
address public immutable i_owner;
constructor() {
i_owner =msg.sender;
}

function fund() public payable {
    // value = value + 2; // If require(msg.value > 1e18); get's success then we will add 1+2 or else we will get 1
    require(msg.value.getConversionRate() >= MINUSD, "Or else Don't send Funds"); // 1e18 = 1 ETH = 1 * 10 ** 18 = 1000000000000000000
    funders.push(msg.sender);
    addressToAmountFunded[msg.sender]=addressToAmountFunded[msg.sender]+msg.value;
    //addressToAmountFunded[msg.sender]=addressToAmountFunded[msg.sender]+msg.value; == addressToAmountFunded[msg.sender]+=msg.value;


}
function withdraw() public onlyOwner {
    // here we use for loop
    // for(starting index; ending index; spacing between indexes)
    for(uint256 funderIndex =0; funderIndex < funders.length; funderIndex++){
        address funder = funders[funderIndex]; // Here functionates from 0 index and we get address
        addressToAmountFunded[funder]=0; // By taking that address from above we will get value that funded from sepecific address.

    }
    // resetting array
    funders = new address[](0); // new keyword is for using contracts from another contracts. Like that we can use address from address we used.
    // transfer
    // (msg.sender) gives address
    // payable(msg.sender) tells payable address. To whom we need to pay back/withdraw.
    // payable(msg.sender).transfer(address(this).balance);
    // this keyword refers to particluar contract that we are in.
    //send
    // bool sendSuccess = payable (msg.sender).send(address(this).balance);
    // require (sendSuccess, "Send Failed");

    //call
    (bool callSuccess, ) = payable (msg.sender).call{value: address(this).balance}("");
    require (callSuccess, "Call Failed");
}
modifier onlyOwner() {
            require (msg.sender == i_owner, "Must be owner!");
            _;
}


}