// SPDX-License-Identifier: GPL-3.0
pragma solidity >=0.4.16 <0.9.0;

contract MyContract7 {  

    // ____ EVENTS ____ 

    mapping(address => uint) public balances;
    address payable wallet; // tienen que ser payable para poder transferir eth

    event Purchase(
        address indexed _buyer,
        uint _amount
    );

    constructor (address payable _wallet){
        wallet = _wallet; // cuando lo deployo tengo que agregarle el hash de la wallet
    }

    function buyToken() public payable{ //tienen que ser payable para poder transferir eth
        //buy token
        balances[msg.sender] += 1; // cada vez que compre un token se le va a aumentar al balance de la address que hizo la compra
        // send ether to the wallet
        wallet.transfer(msg.value); // le enviamos los eth a la wallet que pusimos cuando deployamos
        emit Purchase(msg.sender, 5);
    }
}
