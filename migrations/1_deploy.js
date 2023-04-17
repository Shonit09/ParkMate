const parkmate=artifacts.require("../contracts/ParkMate.sol");

module.exports=function(deployer){
    deployer.deploy(parkmate);
}