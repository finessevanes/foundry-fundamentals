// SPDX-License-Identifier: MIT
pragma solidity ^0.8.19;

import {Test} from "forge-std/Test.sol";
import {FundMe} from "../src/FundMe.sol";
import "forge-std/console.sol";

contract FundMeTest is Test {
    FundMe fundMe;

    function setUp() external {
        fundMe = new FundMe(0x5fb1616F78dA7aFC9FF79e0371741a747D2a7F22);
    }

    function testMinimumDollarIsFive() public {
        assertEq(fundMe.MINIMUM_USD(), 5e18);
    }

    // function testOwnerIsMessageSender() public {
    //     console.log(fundMe.i_owner());
    //     assertEq(fundMe.i_owner(), msg.sender);
    // }

    function testOwnerIsMessageSender() public {
        assertEq(fundMe.i_owner(), address(this));
    }

    function testPriceFeedVersionIsAccurate() public {
        uint256 version = fundMe.getVersion();
        assertEq(version, 4);
    }
}
