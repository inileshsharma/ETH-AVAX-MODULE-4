// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

import "@openzeppelin/contracts/token/ERC20/ERC20.sol";
import "@openzeppelin/contracts/access/Ownable.sol";
import "hardhat/console.sol";

contract DegenToken is ERC20, Ownable {

    constructor() ERC20("Degen", "DGN") {

    }

    function mint(address to, uint256 amount) public onlyOwner {
        _mint(to, amount);
    }

    function burn(uint256 amount) public {
        _burn(msg.sender, amount);
    }

    function TransferToken(address _reciever,uint amount) external  {
        require(balanceOf(msg.sender)>=amount,"ENTER AMOUNT LESS THAN OR EQUAL TO BALANCE");
        approve(msg.sender, amount);
        transferFrom(msg.sender, _reciever, amount);
    }

    function openCart() external pure returns (string memory) {
        return "(1) UPGRADE WEAPONS FOR 500 DENCOINS. (2) GET ULTIMATE ARMOUR FOR 250 DENCOINS. (3) BUY LIMITED EDITION SKINS FOR 150 DENCOINS.";
    }

    function redeem(uint256 item) external payable {

        require(item>0 && item<4,"PLEASE ENTER 1,2 OR 3 ONLY");
        uint dencoins;
        
        if (item ==1){
            dencoins = 500;
            _burn(msg.sender, dencoins);
        }
        else if(item ==2){
            dencoins=250;
            _burn(msg.sender, dencoins);
        }
        else {
            dencoins=150;
            _burn(msg.sender, dencoins);
        }    
    }
}
