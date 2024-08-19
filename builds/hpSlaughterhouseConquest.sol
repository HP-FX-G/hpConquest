//+-------------------------------------------------------------------------+
//|                                            hpSlaughterhouseConquest.sol |
//|        Copyright 2023-2024, HP Investment Trading & Gambling Strategies |
//|                                                     https://hp-fx-g.com |
//+-------------------------------------------------------------------------+

// SPDX-License-Identifier: MIT
pragma solidity 0.8.26;


//+-------------------------------------------------------------------------+
//| class: IERC20                                                           |
//| desc: provides building blocks for ERC-20 token related actions         |
//| params: N/A                                                             |
//| return: N/A                                                             |
//+-------------------------------------------------------------------------+
interface IERC20 {
    function approve(address spender, uint256 amount) external returns (bool);
}

//+-------------------------------------------------------------------------+
//| class: IERC3156FlashBorrower                                            |
//| desc: initializes a flash loan using ERC-3156 protocol                  |
//| params: N/A                                                             |
//| return: N/A                                                             |
//+-------------------------------------------------------------------------+
interface IERC3156FlashBorrower {
    //--- receive a flash loan
    function onFlashLoan(
        address initiator,        // loan initiator address
        address token,            // token to be loaned
        uint256 amount,           // volume to be loaned
        uint256 fee,              // loan repayment fee
        bytes calldata data       // arbitrary data structure for user specifications
    ) external returns (bytes32); // return the keccak256 has of the function
}

//+-------------------------------------------------------------------------+
//| class: SlaughterhouseConquest                                           |
//| desc: allows borrowing that can be returned in one transaction          |
//| params: N/A                                                             |
//| return: N/A                                                             |
//+-------------------------------------------------------------------------+
contract SlaughterhouseConquest is IERC3156FlashBorrower {
    uint256 MAX_INT = 0xffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffff; // max alottment

    //--- ERC-3156 flash loan callback (ignores compiler error)
    function onFlashLoan(
        address initiator,                  // loan initiator address input
        address token,                      // token to be loaned input
        uint256 amount,                     // token volume to be loaned input
        uint256 fee,                        // loan repayment fee input
        bytes calldata data                 // optional data to add to the transacction
    ) external override returns (bytes32) { // return the hash of the function inputs
        //--- set the allowance to payback the flash loan
        IERC20(token).approve(msg.sender, MAX_INT);

        //--- return success to the lender (lender will transfer get the funds back if allowance is set accordingly)
        return keccak256('ERC3156FlashBorrower.onFlashLoan');
    }
}