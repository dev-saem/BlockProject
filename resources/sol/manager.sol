pragma solidity ^0.4.23;
pragma experimental ABIEncoderV2;

contract agricultureContract {

    uint8 numberOfManagers; // 총 제품의 수입니다.
    address contractOwner;

    //구조체
    struct mgr {
        uint   number;
        string manager; //근무자
        string content; //내용
        uint timestamp; //날짜
    }

    mgr[] public mgrs;

    constructor() public {        
        contractOwner = msg.sender;
    }

    function addManagers (uint _initNumber, string _manager, string _content) public {
        mgrs.push(mgr(_initNumber,_manager,_content, now)) -1;
        numberOfManagers++;
    }

    //제품 등록의 수를 리턴합니다.
    function getNumOfManagers() public constant returns(uint8) {
        return numberOfManagers;
    }
    
    function getAllManagers() public view returns (mgr[]) {
        return mgrs;
        
    }

    //번호에 해당하는 제품의 이름을 리턴합니다.
    function getManagers(uint _index) public view returns (uint, string, string, uint) {
        return (mgrs[_index].number, mgrs[_index].manager, mgrs[_index].content, mgrs[_index].timestamp);
    }

    //컨트랙트를 삭제합니다.
    function killContract() public {
        if(contractOwner == msg.sender)
            selfdestruct(contractOwner);
    }
}

CA : 0x0c4f492dA9dcA6c690aA6B8c7d17647bB9025F95
ABI : 
[
        {
            "constant": true,
            "inputs": [],
            "name": "getNumOfManagers",
            "outputs": [
                {
                    "name": "",
                    "type": "uint8"
                }
            ],
            "payable": false,
            "stateMutability": "view",
            "type": "function"
        },
        {
            "constant": false,
            "inputs": [],
            "name": "killContract",
            "outputs": [],
            "payable": false,
            "stateMutability": "nonpayable",
            "type": "function"
        },
        {
            "constant": false,
            "inputs": [
                {
                    "name": "_initNumber",
                    "type": "uint256"
                },
                {
                    "name": "_manager",
                    "type": "string"
                },
                {
                    "name": "_content",
                    "type": "string"
                }
            ],
            "name": "addManagers",
            "outputs": [],
            "payable": false,
            "stateMutability": "nonpayable",
            "type": "function"
        },
        {
            "constant": true,
            "inputs": [
                {
                    "name": "",
                    "type": "uint256"
                }
            ],
            "name": "mgrs",
            "outputs": [
                {
                    "name": "number",
                    "type": "uint256"
                },
                {
                    "name": "manager",
                    "type": "string"
                },
                {
                    "name": "content",
                    "type": "string"
                },
                {
                    "name": "timestamp",
                    "type": "uint256"
                }
            ],
            "payable": false,
            "stateMutability": "view",
            "type": "function"
        },
        {
            "constant": true,
            "inputs": [
                {
                    "name": "_index",
                    "type": "uint256"
                }
            ],
            "name": "getManagers",
            "outputs": [
                {
                    "name": "",
                    "type": "uint256"
                },
                {
                    "name": "",
                    "type": "string"
                },
                {
                    "name": "",
                    "type": "string"
                },
                {
                    "name": "",
                    "type": "uint256"
                }
            ],
            "payable": false,
            "stateMutability": "view",
            "type": "function"
        },
        {
            "constant": true,
            "inputs": [],
            "name": "getAllManagers",
            "outputs": [
                {
                    "components": [
                        {
                            "name": "number",
                            "type": "uint256"
                        },
                        {
                            "name": "manager",
                            "type": "string"
                        },
                        {
                            "name": "content",
                            "type": "string"
                        },
                        {
                            "name": "timestamp",
                            "type": "uint256"
                        }
                    ],
                    "name": "",
                    "type": "tuple[]"
                }
            ],
            "payable": false,
            "stateMutability": "view",
            "type": "function"
        },
        {
            "inputs": [],
            "payable": false,
            "stateMutability": "nonpayable",
            "type": "constructor"
        }
    ]
