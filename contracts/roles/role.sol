// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract Role {
    struct RoleStruct {
        uint256 id;
        string name;
    }

    mapping(uint256 => RoleStruct) public roles;
    uint256 public roleCount;

    event RoleAdded(uint256 id, string name);

    function addRole(string memory _name) public {
        roleCount++;
        roles[roleCount] = RoleStruct(roleCount, _name);
        emit RoleAdded(roleCount, _name);
    }
}