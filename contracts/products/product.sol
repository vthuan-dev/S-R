// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract Product {
    struct ProductStruct {
        uint256 id;
        string name;
        string description;
        uint256 createdAt;
    }

    mapping(uint256 => ProductStruct) public products;
    mapping(uint256 => string[]) public productBatches; // Mapping từ productId đến danh sách mã lô hàng

    uint256 public productCount;

    event ProductAdded(uint256 id, string name, string description);

    function addProduct(string memory _name, string memory _description) public {
        productCount++;
        products[productCount] = ProductStruct({
            id: productCount,
            name: _name,
            description: _description,
            createdAt: block.timestamp
        });

        emit ProductAdded(productCount, _name, _description);
    }

    function addBatchToProduct(uint256 _productId, string memory _batchCode) public {
        productBatches[_productId].push(_batchCode);
    }

    function getBatchesByProduct(uint256 _productId) public view returns (string[] memory) {
        return productBatches[_productId];
    }
}