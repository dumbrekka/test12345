// SPDX-License-Identifier: MIT
pragma solidity 0.8.19;



contract SimpleStorage {

    uint256 public Number = 0;
    uint256 public Number1 = 0;

    struct Person {
    uint favNumber;
    string name;
}

Person public jamie = Person({favNumber: 13, name: "jamie"});

    function store(uint _favNumber) public {
        Number = _favNumber;
    }
    function retrieve() public view returns(uint256) {
        return Number;
    }
}