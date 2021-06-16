pragma solidity ^0.4.23;
pragma experimental ABIEncoderV2;

contract agricultureContract {

    uint8 numberOfPeople; // 총 제품의 수입니다.
    address contractOwner;

    //구조체
    struct person {
        uint   number;
        string pperson; //근무자
        string pcontent; //내용
        uint timestamp; //날짜
    }

    person[] public ppeople;

    constructor() public {        
        contractOwner = msg.sender;
    }

    function addPeople (uint _initNumber, string _pperson, string _pcontent) public {
        ppeople.push(person(_initNumber,_pperson,_pcontent, now)) -1;
        numberOfPeople++;
    }

    //제품 등록의 수를 리턴합니다.
    function getNumOfPeople() public constant returns(uint8) {
        return numberOfPeople;
    }
    
    function getAllPeople() public view returns (person[]) {
        return ppeople;
        
    }

    //번호에 해당하는 제품의 이름을 리턴합니다.
    function getPeople(uint _index) public view returns (uint, string, string, uint) {
        return (ppeople[_index].number, ppeople[_index].pperson, ppeople[_index].pcontent, ppeople[_index].timestamp);
    }

    //컨트랙트를 삭제합니다.
    function killContract() public {
        if(contractOwner == msg.sender)
            selfdestruct(contractOwner);
    }
}


* CA : 0x9B103073DfF99105194B4b2180e0c9224be90768
* ABI :
[
	{
		"constant": true,
		"inputs": [
			{
				"name": "_index",
				"type": "uint256"
			}
		],
		"name": "getPeople",
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
		"constant": false,
		"inputs": [],
		"name": "killContract",
		"outputs": [],
		"payable": false,
		"stateMutability": "nonpayable",
		"type": "function"
	},
	{
		"constant": true,
		"inputs": [],
		"name": "getNumOfPeople",
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
		"inputs": [],
		"name": "getAllPeople",
		"outputs": [
			{
				"components": [
					{
						"name": "number",
						"type": "uint256"
					},
					{
						"name": "pperson",
						"type": "string"
					},
					{
						"name": "pcontent",
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
				"name": "",
				"type": "uint256"
			}
		],
		"name": "ppeople",
		"outputs": [
			{
				"name": "number",
				"type": "uint256"
			},
			{
				"name": "pperson",
				"type": "string"
			},
			{
				"name": "pcontent",
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
		"constant": false,
		"inputs": [
			{
				"name": "_initNumber",
				"type": "uint256"
			},
			{
				"name": "_pperson",
				"type": "string"
			},
			{
				"name": "_pcontent",
				"type": "string"
			}
		],
		"name": "addPeople",
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
	}
]
