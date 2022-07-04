// SPDX-License-Identifier: GPL-3.0
pragma solidity >=0.4.16 <0.9.0;

contract MyContract {   
    string public constant value = "newValue";

    //constructor() {         
    //    value = "myValue";
    //}

    //function get() public view returns(string memory){         
    //    return value;
    //}

    //function set(string memory _value) public {         
    //    value = _value;
    //}

    // ____ ENUMS ____
    enum State {WAITING, READY, ACTIVE}
    State public state;

    constructor () {
        state = State.WAITING;
    }

    function activate() public {
        state = State.ACTIVE;
    }

    function isActive() public view returns (string memory) {
        if (state == State.ACTIVE) {
            return "ACTIVE";
        } else {
            return "INACTIVE";
        }
    }

    function isActiveBool() public view returns (bool) {
        return state == State.ACTIVE;
    }
}
