// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

import "./region.sol";
import "../users/user.sol";

contract Inspector is Region, User {
    struct InspectorStruct {
        uint256 id;
        uint256 userId;
        uint256 regionId;
    }

    mapping(uint256 => InspectorStruct) public inspectors;
    uint256 public inspectorCount;

    event InspectorAdded(uint256 id, uint256 userId, uint256 regionId);

    function addInspector(uint256 _userId, uint256 _regionId) public {
        inspectorCount++;
        inspectors[inspectorCount] = InspectorStruct(inspectorCount, _userId, _regionId);
        emit InspectorAdded(inspectorCount, _userId, _regionId);
    }
}