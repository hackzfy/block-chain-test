// SPDX-License-Identifier: MIT
pragma solidity 0.8.19;

import {SimpleStorage} from "./SimpleStorage.sol";

contract StorageFactory {
    SimpleStorage[] public listOfSimpleStorageContract;

    function createSimpleStorage() public  {
       listOfSimpleStorageContract.push( new SimpleStorage());
    }

    function sfStore(uint256 contractIndex, int256 favoriteNumber) public  {
        listOfSimpleStorageContract[contractIndex].store(favoriteNumber);
    }

    function sfGet(uint256 contractIndex) public view returns(int256) {
        return listOfSimpleStorageContract[contractIndex].retrieve();
    }
}