// SPDX-License-Identifier: MIT
pragma solidity ^0.8.19;

import {GetPrice} from "./GetPrice.sol";

error brokie();

contract FundMe {

    using GetPrice for uint;
    address public immutable i_owner;
    
    constructor() {
        i_owner = msg.sender;
    }

    modifier onlyOwner{
        if (msg.sender != i_owner){
            revert brokie();
        }
        _;
    }

    uint public constant PRICE_USD = 1 * 1e18;
    address[] public fudders;
    mapping(address brokie => uint lost) public loosers;

    function fund() public payable{
        require(msg.value.conversion() >= PRICE_USD, "brokie");
        fudders.push(msg.sender);
        loosers[msg.sender] += msg.value;
    }

    function withdraw() public onlyOwner {
        for(uint index; index < fudders.length; index++){
            address fudder = fudders[index];
            loosers[fudder] = 0;
            fudders = new address[](0);
            (bool greatsuccess,) = msg.sender.call{value: address(this).balance}("");
            require(greatsuccess, "gg");
        }
    }

    receive() external payable { 
        fund(); 
    }
    
    fallback() external payable { 
        fund(); 
    }

}