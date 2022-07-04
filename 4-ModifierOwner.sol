// SPDX-License-Identifier: GPL-3.0
pragma solidity >=0.4.16 <0.9.0;

contract MyContract4 {  

    // ____ MODIFIER ONLY OWNER ____ 
     //Person[] public people;
     uint public peopleCount = 0;
     mapping(uint => Person) public people;

     address owner;

     constructor(){ 
         owner = msg.sender; // esto lo que va a hacer es que cuando el contrato se despliegue, owner pasa a ser quién lo desplegó.
     }

     modifier onlyOwner(){
         require(msg.sender == owner, "no eres quien lo deployo, no puedes hacer cambios");
         _;
     }

     struct Person{
         uint _id;
         string _firstName;
         string _lastName;
     }

     function addPerson(string memory _firstName, string memory _lastName) public onlyOwner {
         peopleCount += 1;
         people[peopleCount] = Person(peopleCount, _firstName, _lastName);
         //people.push(Person(_firstName, _lastName));  
     }
}
