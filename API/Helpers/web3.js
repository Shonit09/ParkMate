const { Web3 }=require('web3');
const ganacheURL='http://<ganache-ip>:<ganache-port>';
const httpProvider=new Web3.providers.HttpProvider(ganacheURL);
const web3 =new Web3(httpProvider);

exports.getAccount=async (code)=>{
    const contract=new web3.eth.Contract(code.abi,code.networks[5777].address);
    const account=await web3.eth.getAccounts();
    return {account,contract};
}