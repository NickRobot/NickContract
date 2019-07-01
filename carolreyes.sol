/**
 *Submitted for verification at Etherscan.io on 2019-05-21
*/

pragma solidity ^0.4.24;

contract carolreyesRegistry {
    address [] public registeredcarolreyes;
    event ContractCreated(address contractAddress);

    function createcarolreyess(string _leftName, string _leftVows, string _rightName, string _rightVows, uint _date) public {
        address newcarolreyes = new carolreyes(msg.sender, _leftName, _leftVows, _rightName, _rightVows, _date);
        emit ContractCreated(newcarolreyes);
        registeredcarolreyes.push(newcarolreyes);
    }

    function getDeployedcarolreyes() public view returns (address[]) {
        return registeredcarolreyes;
    }
}



contract carolreyes {

    event bloBells(address ringer, uint256 count);

    // Owner address
    address public owner;

    ///createcarolreyess Vows
    string public leftName;
    string public leftVows;
    string public rightName;
    string public rightVows;
    // date public carolreyesDate;
    uint public carolreyesDate;
    
    //  counter
    uint256 public bellCounter;

    /**
    * @dev Throws if called by any account other than the owner
    */
    modifier onlyOwner() {
        require(msg.sender == owner);
        _;
    }

    
    constructor(address _owner, string _leftName, string _leftVows, string _rightName, string _rightVows, uint _date) public {
        // TODO: Assert statements for year, month, day
        owner = _owner;
        leftName = _leftName;
        leftVows = _leftVows;
        rightName = _rightName;
        rightVows = _rightVows;
        carolreyesDate = _date; 
    }

    
    function add(uint256 a, uint256 b) private pure returns (uint256 c) {
        c = a + b;
        assert(c >= a);
        return c;
    }

  
    function ringBell() public payable {
        bellCounter = add(1, bellCounter);
        emit bloBells(msg.sender, bellCounter);
    }

    function collect() external onlyOwner {
        owner.transfer(address(this).balance);
    }

   
    function getBalance() public view returns (uint) {
        return address(this).balance;
    }

    
    function getcarolreyesDetails() public view returns (
        address, string, string, string, string, uint, uint256) {
        return (
            owner,
            leftName,
            leftVows,
            rightName,
            rightVows,
            carolreyesDate,
            bellCounter
        );
    }
}