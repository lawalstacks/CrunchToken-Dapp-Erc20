// SPDX-License-Identifier: MIT
pragma solidity ^0.8.26;


 contract CrunchToken{

    string public name = "CrunchToken";
    string public symbol = "CRUNCH";
    string public standard = "CrunchToken v.1";
    uint256 public totalSupply;
    uint public _userId;

    address public ownerOfContract;

    event Transfer(
        address indexed _from,
        address indexed _to,
        uint256 _value
    );

    event Approval(
        address indexed _owner,
        address indexed _spender,
        uint256 _value
    );

    mapping(address => TokenHolderInfo) public tokenHolderInfos;

    struct TokenHolderInfo {
        uint256 _tokenId;
        address _from;
        address _to;
        uint256 _totalToken;
        bool _tokenHolder;
    }

    mapping(address => uint256) public balanceOf;

    constructor(uint256 _initialSupply){
        ownerOfContract = msg.sender;
        balanceOf[msg.sender] = _initialSupply;
        totalSupply = _initialSupply; 

    }

    function inc() internal {
        _userId++;
    }

    function transfer(address _to, uint256 _value) public returns (bool success){
        require(balanceOf[msg.sender] >= _value);
        inc();

        balanceOf[msg.sender] -= _value;
        balanceOf[_to] += _value;
    }

 }
