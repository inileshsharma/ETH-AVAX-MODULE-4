# Degen Token (ERC-20): Unlocking the Future of Gaming

Our task is to create a ERC20 token and deploy it on the Avalanche network for Degen Gaming

## Description

Are you up for a challenge that will put your skills to the test? Degen Gaming 🎮, a renowned game studio, has approached you to create a unique token that can reward players and take their game to the next level. You have been tasked with creating a token that can be earned by players in their game and then exchanged for rewards in their in-game store. A smart step towards increasing player loyalty and retention 🧠

To support their ambitious plans, Degen Gaming has selected the Avalanche blockchain, a leading blockchain platform for web3 gaming projects, to create a fast and low-fee token. With these tokens, players can not only purchase items in the store, but also trade them with other players, providing endless possibilities for growth📈

## Getting Started

### Installing

Clone this repository.

Metamask wallet is required.

Create a Account on snowtrace. 

### program requirements
The smart contract should have the following functionality:

Minting new tokens: The platform should be able to create new tokens and distribute them to players as rewards. Only the owner can mint tokens.

Transferring tokens: Players should be able to transfer their tokens to others.

Redeeming tokens: Players should be able to redeem their tokens for items in the in-game store.

Checking token balance: Players should be able to check their token balance at any time.

Burning tokens: Anyone should be able to burn tokens, that they own, that are no longer needed.


## Help

Mint function
```
    function mint(address to, uint256 amount) public onlyOwner {
        _mint(to, amount);
    }
```
Burn function
```
    function burn(uint256 amount) public {
        _burn(msg.sender, amount);
    }

```
TransferToken function
```
    function TransferToken(address _reciever,uint amount) external  {
        require(balanceOf(msg.sender)>=amount,"Sorry, Not enough degan tokens available");
        approve(msg.sender, amount);
        transferFrom(msg.sender, _reciever, amount);
    }

```
openCart function
```
    function openCart() external pure returns (string memory) {
        return "(1) UPGRADE WEAPONS FOR 500 DENCOINS. (2) GET ULTIMATE ARMOUR FOR 250 DENCOINS. (3) BUY LIMITED EDITION SKINS FOR 150 DENCOINS.";
    }

```
Redeem function
```
    function redeem(uint256 item) external payable {

        require(item>0 && item<4,"PLEASE ENTER 1,2 OR 3 ONLY");
        uint dencoins;
        
        if (item ==1){
            dencoins = 500;
            burn(dencoins);
        }
        else if(item ==2){
            dencoins=250;
            burn(dencoins);
        }
        else {
            dencoins=150;
            burn(dencoins);
        }    
    }

```

## Authors


Nilesh Sharma

@nileshsharma5661@gmail.com


## License

This project is licensed under the [MIT] License - see the LICENSE.md file for details
