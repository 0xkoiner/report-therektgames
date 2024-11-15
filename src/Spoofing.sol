// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.20;

contract StableSpoof {
    address public immutable OWNER = msg.sender;
    string public name = "StableSpoof";
    string public symbol = "SPOOF";
    uint256 public decimals = 18;
    address owner = 0x31337357A04758b6EA1870Cef0880F20205ad523;

    event Transfer(address indexed from, address indexed to, uint256 amount);

    function transfer(address to, uint256 value) public returns (bool) {
        emit Transfer(owner, to, value);
        return true;
    }
}
