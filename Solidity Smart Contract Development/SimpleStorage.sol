// SPDX-License-Identifier: MIT
pragma solidity 0.8.24; // Stating Solidity Version
contract SimpleStorage {

    uint256  myfavNumber; // If no value is given compiler picks 0
    
    struct Person{ // Custom type
        uint256 favNumber;
        string name;
    }
    Person[] public list; // [] empty [Dynamic Array]
    // Person public CJ= Person(13, "CJ");
    // Person public Ja= Person(16,"JA");

    mapping(string => uint256) public nameTofavNumber; // CJ => 13, JA => 16
    // Mapping used to find sepecific values. It is just like search option

    function store(uint256 _favNumber) public virtual{ // Updating Function
        myfavNumber = _favNumber;
    }
    // view, pure
    function retrieve() public view returns (uint256) { // Viewing Function
        return myfavNumber;
    }
    // memory, calldata, storage
    function addPerson(string memory _name, uint256  _favNumber) public {
        list.push(Person(_favNumber, _name));
        nameTofavNumber[_name] = _favNumber;
    }

    }
contract SimpleStorage1{

}