//lấy thông tin về hợp đồng thông qua artifacts.require
const User = artifacts.require("User");

//deploy hợp đồng thông qua deployer 
module.exports = function (deployer) {
  deployer.deploy(User);
};