// SPDX-License-Identifier: SEE LICENSE IN LICENSE
pragma solidity ^0.8.20;

import {BoxV1} from "../src/BoxV1.sol";
import {BoxV2} from "../src/BoxV2.sol";
import {Test} from "forge-std/Test.sol";
import {DeployBox} from "../script/DeployBox.s.sol";
import {UpgradeBox} from "../script/UpgradeBox.s.sol";

contract DeployAndUpgradeTest is Test {
    DeployBox public deployer;
    UpgradeBox public upgrader;
    address public OWNER = makeAddr("owner");

    address public proxy; //address of boxv1 wrapped in ERC1967Proxy which is the proxy contract

    function setUp() public {
        deployer = new DeployBox();
        upgrader = new UpgradeBox();
        proxy = deployer.run(); // Deploy BoxV1 wrapped in ERC1967Proxy and get the proxy address
    }

    function testUpgrades() public {
        BoxV2 boxV2 = new BoxV2();

        upgrader.upgradeBox(proxy, address(boxV2));

        uint256 expectedVersion = 2;
        assertEq(expectedVersion, BoxV2(proxy).version());

        BoxV2(proxy).setNumber(5);
        assertEq(5, BoxV2(proxy).getNumber());
    }

    function testProxyStartsAtBoxV1() public {
        vm.expectRevert();
        BoxV2(proxy).setNumber(7);
    }
}
