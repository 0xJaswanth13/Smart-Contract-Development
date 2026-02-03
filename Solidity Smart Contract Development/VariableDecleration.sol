// SPDX-License-Identifier: MIT
pragma solidity 0.8.18; // Stating Solidity Version
contract SimpleStorage {
    // contract Name
    // Basic Types: boolean, int, uint[unsigned Int], address[just like wallet address], bytes
    uint hasFavNumber = 1; // If no value is given compiler picks 0
    string Name = "Jaswanth";
    bool namecorrect = true; // If no value is given compiler picks false
    address Account1 = 0x3f97f4bA56111E3d85633dEc3B0e7a77FbE07501;
    bytes32 Name1 = "Cj";
}