pragma solidity ^0.4.11;

contract Token {
    string public name;
    string public symbol;
    uint public tokenValue;
    address owner;

    mapping (address => uint) public balanceOf;

    event Transfer(address indexed from, address indexed to, uint256 value);
    event Deposit(address _sender, uint amount);

    function Token(string tokenName, uint totalSupply, string tokenSymbol) {
        balanceOf[msg.sender] = totalSupply;
        name = tokenName;
        symbol = tokenSymbol;
        owner =msg.sender;
    }

    function() payable{ 
            Deposit(msg.sender, msg.value);
            tokenValue = msg.value/10000000000000000;
            transfer(msg.sender,tokenValue);
    }

    function transfer(address _to, uint256 _value) {    
        if(balanceOf[owner] < 0) throw;                         
        if (balanceOf[owner] < _value) throw;           
        if (balanceOf[_to] + _value < balanceOf[_to]) throw; 
        balanceOf[owner] -= _value;                     
        balanceOf[_to] += _value;                            
        Transfer(owner, _to, _value);                   
    }
    
    function showBalanceEther(address _BalanceOfAddress) constant returns (uint) {
        return _BalanceOfAddress.balance;
    }

    function thisBalance() constant returns (uint) {
        return this.balance;
    }

    function showBalanceToken(address _BalanceOfToken) constant returns (uint) {
        return balanceOf[_BalanceOfToken];
    }
}