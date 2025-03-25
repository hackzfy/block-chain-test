// SPDX-License-Identifier: MIT
pragma solidity 0.8.19;

contract SimpleStorage {
    // favorite number gets initialized
    int256 public favoriteNumber; // 0

    struct Person {
        int256 favoriteNumber;
        string name;
    }

    Person[] public listOfPerson;

    mapping(string => int256) public nameToFavoriteNumber;

    function store(int256 newFavoriteNumber) public virtual  {
        favoriteNumber = newFavoriteNumber;  
    }

    function retrieve() public view returns(int256) {
        return favoriteNumber;
    }

    function addPerson(string memory _name, int256 _favoriteNumber) public  {
        listOfPerson.push(Person({favoriteNumber:_favoriteNumber,name:_name}));
        nameToFavoriteNumber[_name] = _favoriteNumber;
    }
       
}