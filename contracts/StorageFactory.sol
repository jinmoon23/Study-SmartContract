// SPDX-License-Identifier: MIT

pragma solidity ^0.8.18;

import {SimpleStorage} from "./SimpleStorage.sol";

contract StorageFactory {
    SimpleStorage[] public listOfSimpleStorageContracts;

    function createSimpleStorageContract() public {
        SimpleStorage newSimpleStorageContract = new SimpleStorage();
        listOfSimpleStorageContracts.push(newSimpleStorageContract);
    }

    function sfStore(uint256 _simpleStorageIndex, uint256 _newSimpleStorageNumber) public {
        // 1. 입력한 인덱스에 해당하는 simpleStorage를 mySimpleStorage 인스턴스에 할당
        SimpleStorage mySimpleStorage = listOfSimpleStorageContracts[_simpleStorageIndex];
        // 2. mySimpleStorage 인스턴스로 SimpleStorage의 store 메서드 호출 -> SimpleStorage의 myFavoriteNumber 속성값을 입력받은 파라미터 값으로 조작
        mySimpleStorage.store(_newSimpleStorageNumber);
    }
    
    function sfGet(uint256 _simpleStorageIndex) public view returns(uint256) {
        SimpleStorage mySimpleStorage = listOfSimpleStorageContracts[_simpleStorageIndex];
        return mySimpleStorage.retrieve();
    }
}