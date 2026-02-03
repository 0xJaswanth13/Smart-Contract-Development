// SPDX-License-Identifier: MIT
pragma solidity 0.8.18; // Stating Solidity Version
contract SimpleStorage {

    uint256  myfavNumber; // If no value is given compiler picks 0
    
    struct Person{ // Custom type
        uint256 favNumber;
        string name;
    }
    Person[] public list; // [] empty [Dynamic Array]
    // Person public CJ= Person(13, "CJ");
    // Person public Ja= Person(16,"JA");

    function store(uint256 _favNumber) public { // Updating Function
        myfavNumber = _favNumber;
    }
    function retrieve() public view returns (uint256) { // Viewing Function
        return myfavNumber;
    }
    function addPerson(string memory _name, uint256 _favNumber) public {
        list.push(Person(_favNumber, _name));

    }
}