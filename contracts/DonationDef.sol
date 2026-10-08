// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;

struct Donation {
    address donor;
    uint256 amount;
    uint64 timestamp;
    uint256 campaignId;
}

contract LatestDonation {
    Donation public latest;

    function setLatest() external {
        latest = Donation(
            msg.sender,
            1 ether,
            uint64(block.timestamp),
            7
        );
    }

    function clearLatest() external {
        delete latest;
    }
}