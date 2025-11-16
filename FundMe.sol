// SPDX-License-Identifier: MIT
pragma solidity ^0.8.19;

import {GetPrice} from "./GetPrice.sol";

contract FundMe {

    using GetPrice for uint;

    uint public priceUSD = 1 * 1e18;
    address[] public fudders;
    mapping(address brokie => uint lost) public loosers;

    function fund() public payable{
        require(msg.value.conversion() >= priceUSD, "brokie");
        fudders.push(msg.sender);
        loosers[msg.sender] += msg.value;
    }

    function withdraw() public {
        for(uint index; index < fudders.length; index++){
            address fudder = fudders[index];
            loosers[fudder] = 0;
        }
    }

}