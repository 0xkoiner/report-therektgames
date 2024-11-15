// SPDX-License-Identifier: MIT

pragma solidity 0.8.27;

import {Script} from "forge-std/Script.sol";
import {StableSpoof} from "src/Token.sol";

contract DeployScriptDemo is Script {
    StableSpoof public stableSpoof;

    function run() external {
        vm.startBroadcast();
        stableSpoof = new StableSpoof();
        vm.stopBroadcast();
    }
}
