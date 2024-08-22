//+-------------------------------------------------------------------------+
//|                                                   hpEthereumReplica.sol |
//|        Copyright 2023-2024, HP Investment Trading & Gambling Strategies |
//|                                                     https://hp-fx-g.com |
//+-------------------------------------------------------------------------+

// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

//--- import headers
import "@openzeppelin/contracts/token/ERC20/ERC20.sol";
import "@openzeppelin/contracts/access/Ownable.sol";
import "@chainlink/contracts/src/v0.8/interfaces/AggregatorV3Interface.sol";

//+-------------------------------------------------------------------------+
//| class: hpEthereumReplica                                                |
//| desc: mints tokens with Ethereum properties                             |
//| params: initialOwner --> contract signer = contract owner               |
//|        initialSupply --> number of tokens to mint                       |
//| return: N/A                                                             |
//+-------------------------------------------------------------------------+
contract hpEthereumReplica is ERC20, Ownable {
    bool public is_destroyed = false;          // current state of tokens
    AggregatorV3Interface internal price_feed; // the Chainlink price feed for establishing token price metadata

    //--- constructor to initialize the contract
    constructor(address initialOwner, uint256 initialSupply) ERC20("Ethereum", "ETH") Ownable(initialOwner) {
        _mint(initialOwner, initialSupply * 10 ** decimals());                          // mint tokens in whole tokens
        transferOwnership(initialOwner);                                                // transfer ownership to the specified initial owner
        price_feed = AggregatorV3Interface(0x694AA1769357215DE4FAC081bf1f309aDC325306); // initialize price feed with ETHUSD ticker address
    }

    //--- token transfer method
    function transfer(address recipient, uint256 amount) public override returns (bool) {
        require(!is_destroyed, "Token Does Not Exist"); // ensure tokens have not self-destructed prior to transfer
        return super.transfer(recipient, amount);       // initiate transfer of a specified amount to a recipient
    }

    //--- token transfer display method
    function transferFrom(address sender, address recipient, uint256 amount) public override returns (bool) {
        require(!is_destroyed, "Token Does Not Exist");       // ensure tokens have not self-destructed prior to transfer
        return super.transferFrom(sender, recipient, amount); // initiate transfer of a specified amount to the recipient from a sender
    }

    //--- function to get the value of the token in ETH
    function _getEthereumValue(uint256 tokenAmount) internal view returns (uint256) {
        (, int256 ethPrice, , ,) = price_feed.latestRoundData(); // fetch the latest price from the Chainlink feed
        uint256 priceInUnits = uint256(ethPrice);                // convert the price to uint256 for formatting
        return (tokenAmount * priceInUnits) / 10**decimals();    // return the ETH value of the token amount
    }

    //--- self-destruct method
    function destroyContract() public onlyOwner {
        is_destroyed = true;                  // set the tokens state for demolition
        uint256 balance = balanceOf(owner()); // triangulate every token
        _burn(owner(), balance);              // self-destruct the tokens
    }
}