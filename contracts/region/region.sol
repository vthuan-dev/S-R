// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract Region {
    struct RegionStruct {
        uint256 id;
        string name;
    }

    mapping(uint256 => RegionStruct) public regions;
    uint256 public regionCount;

    event RegionAdded(uint256 id, string name);

    function addRegion(string memory _name) public {
        regionCount++;
        regions[regionCount] = RegionStruct(regionCount, _name);
        emit RegionAdded(regionCount, _name);
    }
}