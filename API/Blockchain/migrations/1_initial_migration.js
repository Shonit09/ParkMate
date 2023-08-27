const Card=artifacts.require("ParkPay");

module.exports=function(deployer){
    deployer.deploy(Card);
}