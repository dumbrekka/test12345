// SPDX-License-Identifier: MIT

pragma solidity ^0.8.18;

import {SimpleStorage} from "./storage.sol";

contract StorageFactory{

    SimpleStorage[] public listOfSimpleStorageContracts;
    function createSimpleStorageContract() public {
       SimpleStorage newSimpleStorageContract = new SimpleStorage();
       listOfSimpleStorageContracts.push(newSimpleStorageContract);
    }

    function newStore(uint _index, uint _number) public {
        listOfSimpleStorageContracts[_index].store(_number);
    }

    function newRetrieve(uint _index) public view returns(uint) {
        return listOfSimpleStorageContracts[_index].retrieve();
    }

}