// SPDX-License-Identifier: MIT
pragma solidity >=0.4.22 <0.9.0;

contract AutonomousParking {
    address public owner;
    uint256 public parkingFee; // Declare parkingFee variable
    mapping(address => uint256) public carBalances;
    mapping(address => bool) public authorizedCars;
    mapping(address => bool) public engineStarted;
    mapping(address => uint256) public engineStartTimestamp;

    event Deposit(address indexed car, uint256 amount);
    event Payment(address indexed car, uint256 amount);
    event EngineStarted(address indexed car);

    modifier onlyOwner() {
        require(msg.sender == owner, "Only the contract owner can call this function");
        _;
    }

    constructor(uint256 _initialParkingFee) {
        owner = msg.sender;
        parkingFee = _initialParkingFee; // Initialize parkingFee
    }

    function authorizeCar(address carAddress) external onlyOwner {
        authorizedCars[carAddress] = true;
    }

    function revokeAuthorization(address carAddress) external onlyOwner {
        authorizedCars[carAddress] = false;
        engineStarted[carAddress] = false;
    }

    function deposit() external payable {
        require(authorizedCars[msg.sender], "Car is not authorized");
        carBalances[msg.sender] += msg.value;
        emit Deposit(msg.sender, msg.value);
    }

    function payParkingFee(uint256 amount) internal {
        require(carBalances[msg.sender] >= amount, "Insufficient balance");

        carBalances[msg.sender] -= amount;
        emit Payment(msg.sender, amount);
    }

    function startEngine() external {
        require(authorizedCars[msg.sender], "Car is not authorized");
        require(!engineStarted[msg.sender], "Engine is already started");

        engineStarted[msg.sender] = true;
        engineStartTimestamp[msg.sender] = block.timestamp;
        emit EngineStarted(msg.sender);

        // Check if parking fee payment is needed and start the payment process
        if (carBalances[msg.sender] >= parkingFee) {
            payParkingFee(parkingFee);
        }
    }

    function stopEngine() external {
        require(engineStarted[msg.sender], "Engine is not started");

        engineStarted[msg.sender] = false;
    }

    function getCarBalance(address carAddress) external view returns (uint256) {
        return carBalances[carAddress];
    }

    // Set parking fee amount
    function setParkingFee(uint256 _newParkingFee) external onlyOwner {
        parkingFee = _newParkingFee;
    }
}
