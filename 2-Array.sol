// SPDX-License-Identifier: GPL-3.0
pragma solidity >=0.4.16 <0.9.0;

contract MyContract2 {  

    // ____ ARRAY ____ 
     Person[] public people;
     uint public peopleCount;

     struct Person{
         string _firstName;
         string _lastName;
     }

     function addPersona(string memory _firstName, string memory _lastName) public {
         //people.push(Person(_firstName, _lastName));
         
         Person memory person;
         person._firstName = _firstName;
         person._lastName = _lastName;
         people.push(person);
         peopleCount += 1;
     }

     function addPerson2(string memory _firstName, string memory _lastName) public {
         
         people.push(Person(_firstName, _lastName));
         peopleCount += 1;
     }
}
