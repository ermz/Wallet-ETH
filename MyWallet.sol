pragma solidity >0.5.13 <=0.7.0;

import "./WalletOwned.sol";

contract WalletContract is WalletOwned{
    uint public wallet = 25;
    bool public allowance = false;
    address public currentPerson = msg.sender;
    
    function payMe() public onlyOwner payable {
        wallet += msg.value;
    }
    
    function moneyAvailable() public view returns(uint) {
        return address(this).balance;
    }
    
    function withdrawAllMoney() public onlyOwner {
        address payable to = msg.sender;
        to.transfer(this.moneyAvailable());
        
    }
    
    function withdrawMoneyTo(address payable _to) public onlyOwner {
        _to.transfer(this.moneyAvailable());
    }
    
    function withdrawFrom(address payable _from, uint _amount) public {
        require(address(_from).balance >= _amount, "Too much money!");
        assert(allowance == true);
        
        _from.transfer(_amount);
    }
    
}