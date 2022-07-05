// SPDX-License-Identifier: GPL-3.0
pragma solidity >=0.4.16 <0.9.0;

contract ERC20Token {
    // ____ Token ERC20 ____
    string public name;
    mapping(address => uint) public balances;

    function mint() public {
        balances[tx.origin] ++; // tx.origin es la persona que originó la transacción
    }
}

contract MyContract8 {  
    // ____ Contract ____ 
    address payable wallet; // tienen que ser payable para poder transferir eth
    address public token;

    constructor (address payable _wallet, address _token){
        wallet = _wallet; // cuando lo deployo tengo que agregarle el hash de la wallet
        token = _token;
    }

    function buyToken() public payable{ //tienen que ser payable para poder transferir eth
        ERC20Token _token = ERC20Token(address(token));
        _token.mint();
        wallet.transfer(msg.value); // le enviamos los eth a la wallet que pusimos cuando deployamos
    }
}
