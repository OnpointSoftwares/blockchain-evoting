pragma solidity 0.5.16;

contract Contest{
	
	struct Contestant{
		uint id;
		string name;
		uint voteCount;
		string party;
		uint age;
		string qualification;
	}

	struct Voter{
		bool hasVoted;
		uint vote;
		bool isRegistered;
	}

	address admin;
	mapping(uint => Contestant) public contestants; 
   // mapping(address => bool) public voters;
    mapping(address => Voter) public voters;
	uint public contestantsCount;
	// uint public counter;
	enum PHASE{reg, voting , done}
	PHASE public state;

	modifier onlyAdmin(){
		require(msg.sender==admin);
		_;
	}
	
	modifier validState(PHASE x){
	    require(state==x);
	    _;
	}

	constructor() public{
		admin=msg.sender;
        state=PHASE.reg;
		// counter = 0;

	}

    function changeState(PHASE x) onlyAdmin public{
		require(x > state);
        state = x;
    }

	function addContestant(string memory _name , string memory _party , uint _age , string memory _qualification) public onlyAdmin validState(PHASE.reg){
		contestantsCount++;
		contestants[contestantsCount]=Contestant(contestantsCount,_name,0,_party,_age,_qualification);
	}

	function voterRegisteration(address user) public onlyAdmin validState(PHASE.reg){
		voters[user].isRegistered=true;
	}

	function vote(uint _contestantId) public validState(PHASE.voting) returns (bool success) {
    require(!voters[msg.sender].hasVoted, "Voter has already voted");
    require(_contestantId > 0 && _contestantId <= contestantsCount, "Invalid contestant ID");

    uint gasStart = gasleft(); // Record the starting gas value

    contestants[_contestantId].voteCount++;
    voters[msg.sender].hasVoted = true;
    voters[msg.sender].vote = _contestantId;

    uint gasSpent = gasStart - gasleft(); // Calculate gas spent

    // You can log or store the gas spent for analysis
    emit GasSpent(msg.sender, gasSpent);

    return true;
}

event GasSpent(address indexed voter, uint gasSpent);
}