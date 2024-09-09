// SPDX-License-Identifier: SEE LICENSE IN LICENSE
pragma solidity ^0.8.20;

import {ERC1967Proxy} from "@openzeppelin/contracts/proxy/ERC1967/ERC1967Proxy.sol";
import {Script} from "forge-std/Script.sol";
import {BoxV1} from "..//src/BoxV1.sol";

contract DeployBox is Script {
    BoxV1 boxV1;

    function run() external returns (address) {
        address proxy = deployBox();
        return proxy;
    }

    function deployBox() public returns (address) {
        vm.startBroadcast();
        boxV1 = new BoxV1(); // implementation (Logic) also address
        ERC1967Proxy proxy = new ERC1967Proxy(address(boxV1), "");
        vm.stopBroadcast();
        return address(proxy);
    }
}
