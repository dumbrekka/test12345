// SPDX-License-Identifier: MIT
pragma solidity 0.8.19;



contract Storage {

    uint256 public Number = 0;

    struct Person {
    uint favNumber;
    string name;
    }

    Person[] public listOfPeople;
    mapping(string => uint) public nameTofavNumber;

    function store(uint _favNumber) public {
        Number = _favNumber;
    }
    function retrieve() public view returns(uint256) {
        return Number;
    }

    function addPerson(string memory _name, uint _favNumber) public {
        listOfPeople.push(Person(_favNumber, _name));
        nameTofavNumber[_name] = _favNumber;
    }
}