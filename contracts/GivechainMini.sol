// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;

enum Category {
    EDU,
    HEALTH,
    ENV,
    ART
}

contract GivechainMini {
    uint256 public goal = 10 ether;
    uint256 public totalDonated;
    bool public campaignActive = true;
    address payable public beneficiary;

    mapping(address => uint256) public donations;

    constructor(address payable initialBeneficiary) {
        require(
            initialBeneficiary != payable(address(0)),
            "Invalid beneficiary"
        );

        beneficiary = initialBeneficiary;
    }

    function donate() external payable {
        require(campaignActive, "Campaign is not active");
        require(msg.value > 0, "Donation must be greater than zero");

        totalDonated += msg.value;
        donations[msg.sender] += msg.value;
    }

    function withdraw() external {
        require(msg.sender == beneficiary, "Not beneficiary");

        uint256 balance = address(this).balance;
        require(balance > 0, "No balance");

        (bool success, ) = beneficiary.call{value: balance}("");
        require(success, "Withdrawal failed");
    }
}