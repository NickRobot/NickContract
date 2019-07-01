pragma solidity ^0.5.0;

contract ChapasNick {
    uint numChapas;
    address public chairperson;

    struct Chapa {
        address beneficiary;
        string email;
        bool used;
        bytes32 ip;
    }

    mapping (string => Chapa) chapas;

    constructor() public{
        chairperson = msg.sender;
    }

    function newChapa(string memory newemail) public{
        require((msg.sender == chairperson) && !chapas[newemail].used);
        numChapas++;

        Chapa storage chapa = chapas[newemail];
        chapa.beneficiary = msg.sender;
        chapa.used = true;
        chapa.ip = "127.0.0.1";

    }

}