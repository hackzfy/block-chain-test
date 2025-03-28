// SPDX-License-Identifier: MIT
pragma solidity 0.8.19;

import {SimpleStorage} from "./SimpleStorage.sol";


contract AddFiveStorage is SimpleStorage {

    function store(int256 _favoriteNumber) public override   {
        favoriteNumber = _favoriteNumber + 5;
    }
    
}