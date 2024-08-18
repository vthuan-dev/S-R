const Product = artifacts.require("Product");

module.exports = function (deployer) {
  deployer.deploy(Product).then(function(instance) {
    const productContractAddress = instance.address;
    // Sau khi triển khai hợp đồng sản phẩm, triển khai hợp đồng GrapefruitTraceability
    const GrapefruitTraceability = artifacts.require("GrapefruitTraceability");
    deployer.deploy(GrapefruitTraceability, productContractAddress);
  });
};