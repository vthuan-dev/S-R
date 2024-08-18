// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

import "./product.sol";

contract Batch {
    struct BatchStruct {
        string code;
        uint256 productId;
        uint256 quantity;
        string productionDate;
        string expireDate;
        uint256 createdAt;
    }

    mapping(string => BatchStruct) public batches;

    Product productContract;

    event BatchAdded(string code, uint256 productId, uint256 quantity);

    constructor(address _productContractAddress) {
        productContract = Product(_productContractAddress);
    }

    function addBatch(
        string memory _code,
        uint256 _productId,
        uint256 _quantity,
        string memory _productionDate,
        string memory _expireDate
    ) public {
        BatchStruct memory newBatch = BatchStruct({
            code: _code,
            productId: _productId,
            quantity: _quantity,
            productionDate: _productionDate,
            expireDate: _expireDate,
            createdAt: block.timestamp
        });

        batches[_code] = newBatch;
        productContract.addBatchToProduct(_productId, _code); // Thêm mã lô hàng vào sản phẩm tương ứng

        emit BatchAdded(_code, _productId, _quantity);
    }
}