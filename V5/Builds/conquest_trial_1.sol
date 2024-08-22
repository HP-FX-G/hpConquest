// SPDX-License-Identifier: MIT
pragma solidity ^0.8.10;

import "https://github.com/aave/aave-v3-core/blob/master/contracts/flashloan/base/FlashLoanSimpleReceiverBase.sol";
import "https://github.com/aave/aave-v3-core/blob/master/contracts/interfaces/IPoolAddressesProvider.sol";
import "https://github.com/aave/aave-v3-core/blob/master/contracts/dependencies/openzeppelin/contracts/IERC20.sol";

contract Conquest_Simulation is FlashLoanSimpleReceiverBase {
    address payable owner;
    address payable public alpha; // address for Objective Alpha

    //--- address provider (Sepolia): 0x012bAC54348C0E635dCAc9D5FB99f06F24136C9A
    constructor(address _addressProvider)
        FlashLoanSimpleReceiverBase(IPoolAddressesProvider(_addressProvider)) {
        alpha = payable(0x7f63E93d6CfF36bdb233bF53741fD3dF9f4B5868);
    }

    function fn_RequestFlashLoan(address _token, uint256 _amount) public {
        address receiverAddress = address(this);
        address asset = _token; // USDT Token Reserve (Sepolia): 0xaA8E23Fb1079EA71e0a56F48a2aA51851D8433D0
        uint256 amount = _amount;
        bytes memory params = "";
        uint16 referralCode = 0;

        POOL.flashLoanSimple(
            receiverAddress,
            asset,
            amount,
            params,
            referralCode
        );
    }
    
    //--- receive USDT @ Bravo
    function  executeOperation(
        address asset,
        uint256 amount,
        uint256 premium,
        address initiator,
        bytes calldata params
    )  external override returns (bool) {
        //--- transfer USDT from Bravo to Alpha
        //IERC20(asset).transfer(alpha, amount);
        
        //--- transfer USDT from Alpha to Bravo
        //IERC20(asset).transfer(address(this), amount);
        
        //--- evacuate Bravo with reserve USDT
        uint256 totalAmount = amount + premium;
        IERC20(asset).approve(address(POOL), totalAmount);

        //--- complete extraction
        return true;
    }
    //--- return USDT
    receive() external payable {}
}