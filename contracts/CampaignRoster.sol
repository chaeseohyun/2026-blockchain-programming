// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;

contract CampaignRoster {
    uint256[] public campaignIds;

    function open(uint256 campaignId) external {
        campaignIds.push(campaignId);
    }

    function closeLast() external {
        require(campaignIds.length > 0, "Array is empty");

        campaignIds.pop();
    }

    function swapRemove(uint256 index) external {
        require(campaignIds.length > 0, "Array is empty");
        require(index < campaignIds.length, "Invalid index");

        campaignIds[index] = campaignIds[campaignIds.length - 1];
        campaignIds.pop();
    }
}