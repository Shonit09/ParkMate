// SPDX-License-Identifier: MIT
pragma solidity ^0.8.19;

contract ParkMate{
    uint public count;
    function get() public view returns(uint){
        return count;
    }

    function inc() public{
        count+=1;
    }

    function dec() public{
        count-=1;
    }
}

/*
contract ParkMate {

    address public owner;
    uint public balance;

    constructor() {
        owner = msg.sender;
    }

    function payParkingFees(uint amount) public {
        require(msg.sender == owner, "Only the car owner can pay the parking fees.");
        require(balance >= amount, "Insufficient balance to pay the parking fees.");

        balance -= amount;
        //To authorize the start of the engine goes here
    }

    function deposit() public payable {
        require(msg.value > 0, "Deposit amount must be greater than 0.");
        balance += msg.value;
        //Yo notify the car that it has received a deposit goes here
    }

    function withdraw(uint amount) public {
        require(msg.sender == owner, "Only the car owner can withdraw funds from the Car Wallet.");
        require(balance >= amount, "Insufficient balance to make the withdrawal.");

        balance -= amount;
        payable(owner).transfer(amount);
    }

    function getBalance() public view returns (uint) {
        return balance;
    }
}
*/