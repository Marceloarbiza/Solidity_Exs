// SPDX-License-Identifier: GPL-3.0
pragma solidity >=0.4.16 <0.9.0;

contract ERC20Token {
    // ____ Token ERC20 ____
    string public name;
    mapping(address => uint) public balances;

    constructor(string memory _name) {
        name = _name;
    } 

    function mint() public virtual {
        balances[tx.origin] ++; // cada vez que compre un token se le va a aumentar al balance de la address que hizo la compra
    }
}

contract MyToken is ERC20Token{  
    // ___ CHILD ___
    string public symbol;
    address[] public owners;
    uint ownerCount;

    constructor(string memory _name, string memory _symbol) ERC20Token(_name) {
        symbol = _symbol;
    }

    function mint() public override{
        super.mint();
        ownerCount ++;
        owners.push(msg.sender);
    }
}
