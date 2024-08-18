// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

import "./region.sol";
import "../users/user.sol";

contract Farmer is Region, User {
    struct FarmerStruct {
        uint256 id;
        uint256 userId;
        uint256 regionId;
    }

    mapping(uint256 => FarmerStruct) public farmers;
    uint256 public farmerCount;

    event FarmerAdded(uint256 id, uint256 userId, uint256 regionId);

    function addFarmer(uint256 _userId, uint256 _regionId) public {
        farmerCount++;
        farmers[farmerCount] = FarmerStruct(farmerCount, _userId, _regionId);
        emit FarmerAdded(farmerCount, _userId, _regionId);
    }
}