// SPDX-License-Identifier: MIT
pragma solidity ^0.5.16;

contract Charity {
    struct Beneficiary {
        address beneficiaryAddress;
        string beneficiaryName;
    }

    address public owner;
    mapping(address => bool) public beneficiaries;
    mapping(address => Beneficiary) public beneficiaryInfo;

    modifier onlyOwner() {
        require(msg.sender == owner, "Only the owner can call this function");
        _;
    }

    constructor() public {
        owner = msg.sender;
    }

    function addBeneficiary(address _beneficiary, string memory _beneficiaryName) public onlyOwner {
        beneficiaries[_beneficiary] = true;
        beneficiaryInfo[_beneficiary] = Beneficiary(_beneficiary, _beneficiaryName);
    }

    function removeBeneficiary(address _beneficiary) public onlyOwner {
        beneficiaries[_beneficiary] = false;
        delete beneficiaryInfo[_beneficiary];
    }
}
