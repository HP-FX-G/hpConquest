//+-------------------------------------------------------------------------+
//|                                            conquest_test_deployment.sol |
//|        Copyright 2023-2024, HP Investment Trading & Gambling Strategies |
//|                                                     https://hp-fx-g.com |
//+-------------------------------------------------------------------------+

// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

//--- import headers
import 'hpConquest/V4/Dependencies/@forge-std/FlashLoan.sol';
import 'hpConquest/V4/Dependencies/@forge-std/Tokens.sol';
import 'hpConquest/V4/Dependencies/@forge-std/console.sol';


//+-------------------------------------------------------------------------+
//| @class: Conquest_Test_Deployment                                        |
//| @desc: experiment with various flash loan structures and models         |
//| @params: FlashLoan --> generic flash loan borrowing procedure           |
//|             Tokens --> procedure for token borrowing and repayment      | 
//| @return: Success/Failure (to execute the flash loan/achieve conquest)   |
//+-------------------------------------------------------------------------+
contract Conquest_Test_Deployment is FlashLoan, Tokens {
    FlashLoanProviders internal _flp;

    function initiateAttack(FlashLoanProviders flp) external {
        _flp = flp;
        uint256 fee;
        if (flp == FlashLoanProviders.AAVEV1 || flp == FlashLoanProviders.AAVEV2 || flp == FlashLoanProviders.AAVEV3) {
            fee = 900000000000000;
        } else if (flp == FlashLoanProviders.UNISWAPV2) {
            fee = 3009027081243732;
        } else if (flp == FlashLoanProviders.UNISWAPV3) {
            fee = 500000000000000 + 1;
        }
        deal(EthereumTokens.DAI, address(this), fee);
        console.log("DAI BALANCE BEFORE:", EthereumTokens.DAI.balanceOf(address(this)));
        takeFlashLoan(flp, address(EthereumTokens.DAI), 1 ether);
    }

    function _executeAttack() internal override {
        console.log("DAI BALANCE DURING:", EthereumTokens.DAI.balanceOf(address(this)));
        if (currentFlashLoanProvider() == FlashLoanProviders.AAVEV1) {
            // Execute attack with funds from AAVEV1
        }
    }

    function _completeAttack() internal override {
        console.log("DAI BALANCE AFTER :", EthereumTokens.DAI.balanceOf(address(this)));
    }
}