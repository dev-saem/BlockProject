pragma solidity ^0.4.23;
pragma experimental ABIEncoderV2;

contract agricultureContract {

    uint8 numberOfJournals; // 총 제품의 수입니다.
    address contractOwner;


    //구조체
    struct journal {
        uint   number;
        string user; //근무자
        string journal; //내용
        uint timestamp; //날짜
    }

    journal[] public journals;

    constructor() public {        
        contractOwner = msg.sender;
    }

    function addJournal (uint _initNumber, string _user, string _journal) public {
        journals.push(journal(_initNumber,_user,_journal, now)) -1;
        numberOfJournals++;
    }

    //제품 등록의 수를 리턴합니다.
    function getNumOfJournals() public constant returns(uint8) {
        return numberOfJournals;
    }
    
    function getAlljournals() public view returns (journal[]) {
        return journals;
        
    }

    //번호에 해당하는 제품의 이름을 리턴합니다.
    function getJournal(uint _index) public view returns (uint, string, string, uint) {
        return (journals[_index].number, journals[_index].user, journals[_index].journal, journals[_index].timestamp);
    }

    //컨트랙트를 삭제합니다.
    function killContract() public {
        if(contractOwner == msg.sender)
            selfdestruct(contractOwner);
    }
}