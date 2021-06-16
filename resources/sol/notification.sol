pragma solidity ^0.4.23;
pragma experimental ABIEncoderV2;

contract agricultureContract {

    uint8 numberOfHumans; // 총 제품의 수입니다.
    address contractOwner;

    //구조체
    struct human {
        uint   number;
        string hhuman; //근무자
        string hcontent; //내용
        uint timestamp; //날짜
    }

    human[] public humans;

    constructor() public {        
        contractOwner = msg.sender;
    }

    function addHumans (uint _initNumber, string _hhuman, string _hcontent) public {
        humans.push(human(_initNumber,_hhuman,_hcontent, now)) -1;
        numberOfHumans++;
    }

    //제품 등록의 수를 리턴합니다.
    function getNumOfHumans() public constant returns(uint8) {
        return numberOfHumans;
    }
    
    function getAllHumans() public view returns (human[]) {
        return humans;
        
    }

    //번호에 해당하는 제품의 이름을 리턴합니다.
    function getHumans(uint _index) public view returns (uint, string, string, uint) {
        return (humans[_index].number, humans[_index].hhuman, humans[_index].hcontent, humans[_index].timestamp);
    }

    //컨트랙트를 삭제합니다.
    function killContract() public {
        if(contractOwner == msg.sender)
            selfdestruct(contractOwner);
    }
}

* CA : 0x77191E84eD11d5dd3c9646F49b3F0Ec4AbFfaf18
* ABI :
[
	{
		"constant": false,
		"inputs": [
			{
				"name": "_initNumber",
				"type": "uint256"
			},
			{
				"name": "_hhuman",
				"type": "string"
			},
			{
				"name": "_hcontent",
				"type": "string"
			}
		],
		"name": "addHumans",
		"outputs": [],
		"payable": false,
		"stateMutability": "nonpayable",
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
		"inputs": [],
		"payable": false,
		"stateMutability": "nonpayable",
		"type": "constructor"
	},
	{
		"constant": true,
		"inputs": [],
		"name": "getAllHumans",
		"outputs": [
			{
				"components": [
					{
						"name": "number",
						"type": "uint256"
					},
					{
						"name": "hhuman",
						"type": "string"
					},
					{
						"name": "hcontent",
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
		"constant": true,
		"inputs": [
			{
				"name": "_index",
				"type": "uint256"
			}
		],
		"name": "getHumans",
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
		"name": "getNumOfHumans",
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
		"constant": true,
		"inputs": [
			{
				"name": "",
				"type": "uint256"
			}
		],
		"name": "humans",
		"outputs": [
			{
				"name": "number",
				"type": "uint256"
			},
			{
				"name": "hhuman",
				"type": "string"
			},
			{
				"name": "hcontent",
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
	}
]
