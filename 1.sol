pragma solidity ^0.8.0;

contract SimpleContract {
    address public owner;
    uint public contractBalance;

    event FundsDeposited(address depositor, uint amount);
    event FundsWithdrawn(address recipient, uint amount);

    constructor() {
        owner = msg.sender;
    }

    function deposit() public payable {
        require(msg.value > 0, "Amount must be greater than zero.");
        contractBalance += msg.value;
        emit FundsDeposited(msg.sender, msg.value);
    }

    function withdraw(uint amount) public {
        require(amount > 0, "Amount must be greater than zero.");
        require(amount <= contractBalance, "Insufficient contract balance.");

        payable(msg.sender).transfer(amount);
        contractBalance -= amount;
        emit FundsWithdrawn(msg.sender, amount);
    }

    function getContractBalance() public view returns (uint) {
        return contractBalance;
    }
}
