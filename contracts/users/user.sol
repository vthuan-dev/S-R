// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract User {
    struct UserStruct {
        uint256 id;
        string name;
        string email;
        string userAddress;
        string dob;
        string gender;
        uint256 roleId; // 1: Farmer, 2: Inspector
        uint256 regionId;
        uint256 createdAt;
    }

    mapping(address => UserStruct) public users;
    uint256 public userCount;

    event UserAdded(uint256 id, string name, uint256 roleId, uint256 regionId);

    function addUser(
        string memory _name,
        string memory _email,
        string memory _userAddress,
        string memory _dob,
        string memory _gender,
        uint256 _roleId,
        uint256 _regionId
    ) public {
        userCount++;
        users[msg.sender] = UserStruct({
            id: userCount,
            name: _name,
            email: _email,
            userAddress: _userAddress,
            dob: _dob,
            gender: _gender,
            roleId: _roleId,
            regionId: _regionId,
            createdAt: block.timestamp
        });

        emit UserAdded(userCount, _name, _roleId, _regionId);
    }

    function getUser(address _userAddress) public view returns (UserStruct memory) {
        return users[_userAddress];
    }

    function getUsersByRegion(uint256 _regionId) public view returns (UserStruct[] memory) {
        uint256 count = 0;
        address[] memory userAddresses = new address[](userCount);
        uint256 index = 0;

        for (uint256 i = 0; i < userCount; i++) {
            if (users[userAddresses[i]].regionId == _regionId) {
                count++;
            }
        }

        UserStruct[] memory regionUsers = new UserStruct[](count);
        index = 0;
        for (uint256 i = 0; i < userCount; i++) {
            if (users[userAddresses[i]].regionId == _regionId) {
                regionUsers[index] = users[userAddresses[i]];
                index++;
            }
        }

        return regionUsers;
    }
}