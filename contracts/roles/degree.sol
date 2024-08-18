// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract Degree {
    struct DegreeStruct {
        uint256 id;
        string name;
    }

    mapping(uint256 => DegreeStruct) public degrees;
    uint256 public degreeCount;

    event DegreeAdded(uint256 id, string name);

    function addDegree(string memory _name) public {
        degreeCount++;
        degrees[degreeCount] = DegreeStruct(degreeCount, _name);
        emit DegreeAdded(degreeCount, _name);
    }
}