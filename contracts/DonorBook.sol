// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;

contract DonorBook {
    mapping(address => uint256) public donations;
    uint256 public totalDonated;

    function donate() external payable {
        require(msg.value > 0, "Empty donation");

        donations[msg.sender] += msg.value;
        totalDonated += msg.value;
    }

    function refund(uint256 amount) external {
        require(amount > 0, "Invalid amount");
        require(
            amount <= donations[msg.sender],
            "Insufficient donation"
        );

        donations[msg.sender] -= amount;
        totalDonated -= amount;

        (bool success, ) = payable(msg.sender).call{value: amount}("");
        require(success, "Refund failed");
    }
}