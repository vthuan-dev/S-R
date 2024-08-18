// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract ActivityLog {
    struct ActivityLogStruct {
        uint256 id;
        uint256 farmerId;
        string batchCode;
        string activity;
        uint256 timestamp;
    }

    mapping(uint256 => ActivityLogStruct) public activityLogs;
    uint256 public activityLogCount;

    event ActivityLogged(uint256 id, uint256 farmerId, string batchCode, string activity);

    function logActivity(uint256 _farmerId, string memory _batchCode, string memory _activity) public {
        activityLogCount++;
        activityLogs[activityLogCount] = ActivityLogStruct(activityLogCount, _farmerId, _batchCode, _activity, block.timestamp);
        emit ActivityLogged(activityLogCount, _farmerId, _batchCode, _activity);
    }
}