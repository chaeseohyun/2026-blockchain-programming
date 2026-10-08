// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;

contract Counter {
    uint256 public count;
    int256 public delta;

    function inc(uint256 n) external {
        count += n;
        delta += int256(n);
    }

    function dec(uint256 n) external {
        require(n <= count, "Cannot decrease below zero");

        count -= n;
        delta -= int256(n);
    }
}