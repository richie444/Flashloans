// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.10;


import {FlashLoanSimpleReceiverBase} from "@aave/core-v3/contracts/flashloan/base/FlashLoanSimpleReceiverBase.sol";
import {IPoolAddressesProvider} from "@aave/core-v3/contracts/interfaces/IPoolAddressesProvider.sol";
import {IERC20} from "@aave/core-v3/contracts/dependencies/openzeppelin/contracts/IERC20.sol";

contract Flashloan FlashLowSimpleReceiverBase {
    constructor(IPoolAddressesProvider _provider) FlashLoanSimpleReceiverBase(_addressprovider) {}
    constructor(address _addressProvider)
    FlashLoanSimpleReceiverBase(IPoolAddressesProvider(_addressProvider))
{
    owner = payable(msg.sender);
}

/**
    This function is called after your contract has received the flash loaned amount
 */
function executeOperation(
    address asset,
    uint256 amount,
    uint256 premium,
    address initiator,
    bytes calldata params
) external override returns (bool) {
     

        //We hae the borrowed amount here
        //custom logic goes here
        uin256 amountOwned  = amount + premium;
        IERC20(asset).transfer(initiator, amountOwned);

        return true;


        function requestFlashloan(address _token, uint256 amount ) public {
            address receiverAddress = address(this);
            address asset = _token;
            uint256 amount = _amount;
            bytes memory params = "";
            uint16 referralCode = 0;


            bytes memory params = "";

            POOL.flashLoanSimple(
                receiver address 
                asset
                amount
                params
                referralCode
                );
            
            
        }

    }

    function getBalance(address _token) public view returns (uint256) {
        return IERC20(_token).balanceOf(address(this));
    }


    function withdraw(address _token, uint256 _amount) public {
        require(msg.sender == owner, "only owner");
        IERC20(_token).transfer(owner, _amount);
    }
    modifier onlyOwner() {
        require(msg.sender == owner, "only owner can call this function");
        
    }
    receive() external payable {
        
        
    }
}



