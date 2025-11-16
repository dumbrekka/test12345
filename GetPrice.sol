// SPDX-License-Identifier: MIT
pragma solidity ^0.8.19;

import {AggregatorV3Interface} from "@chainlink/contracts/src/v0.8/shared/interfaces/AggregatorV3Interface.sol";

library GetPrice {
    
    function getLatestPrice() internal view returns(uint) {
        AggregatorV3Interface LatestPrice = AggregatorV3Interface(0x5f4eC3Df9cbd43714FE2740f5E3616155c5b8419);
        (,int256 answer,,,) = LatestPrice.latestRoundData();
        return uint(answer * 1e10);
    }

    function conversion(uint ethamount) internal view returns(uint){
        uint ethamountinusd = (ethamount * getLatestPrice()) / 1e18;
        return ethamountinusd;
    }
}