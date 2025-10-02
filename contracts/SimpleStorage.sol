// SPDX-License-Identifier: MIT
pragma solidity 0.8.24; // this is the solidity version

contract SimpleStorage {
    // favoriteNumber gets initialized to 0 if no value is given.
    uint myFavoriteNumber; // this is a storage variable
    uint256[] listOfFavoriteNumbers;
    
    struct Person {
        uint256 favoriteNumber;
        string name;
    }

    Person[] public listOfPeople;

    mapping (string => uint256) public nameToFavoriteNumber;

    function store(uint256 _favoriteNumber) public {
        myFavoriteNumber = _favoriteNumber;
    }
    function retrieve() public view returns(uint256) {
        return myFavoriteNumber;
    }

    function addPerson(string memory _name, uint256 _favoriteNumber) public {
        listOfPeople.push(Person(_favoriteNumber, _name)); 
        nameToFavoriteNumber[_name] = _favoriteNumber;
    }
}