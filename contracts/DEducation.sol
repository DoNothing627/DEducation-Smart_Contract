// SPDX-License-Identifier: MIT
pragma solidity ^0.8.9;

import "@openzeppelin/contracts/access/Ownable.sol";

// Uncomment this line to use console.log
// import "hardhat/console.sol";

contract DEducation is Ownable {
    struct Transcript {
        string Semester;
        string Subject;
    }

    event AddNewTranscript(
        address _studentAddress,
        string _hashcode,
        string _semester,
        string _subject
    );

    mapping(address => mapping(address => mapping(string => Transcript)))
        public TranscriptUploaded;

    function addNewTranscript(
        address _studentAddress,
        string memory _hashcode,
        string memory _semester,
        string memory _subject
    ) public {
        TranscriptUploaded[msg.sender][_studentAddress][_hashcode] = Transcript(
            _semester,
            _subject
        );
        emit AddNewTranscript(_studentAddress, _hashcode, _semester, _subject);
    }
}
