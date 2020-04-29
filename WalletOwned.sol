pragma solidity >0.5.13 <=0.7.0;

contract WalletOwned {
    address owner;
    
    constructor() public {
        owner = msg.sender;
    }
    
    modifier onlyOwner() {
        require(owner == msg.sender, "You are not the owner!");
        _;
    }
}