// SPDX-License-Identifier: MIT
pragma solidity ^0.8.9;

import "@openzeppelin/contracts/access/Ownable.sol";

// Uncomment this line to use console.log
// import "hardhat/console.sol";

contract DEducation is Ownable {
    struct StudentTranscript {
        address StudentAddress;
        string Classroom;
        string HashCode;
    }

    event AddNewTranscriptForClass(string _classroom, string _hashcode);
    event AddNewTranscriptForStudents(StudentTranscript[] _studentTranscripts);

    mapping(address => mapping(string => string)) public TranscriptForClass;
    mapping(address => mapping(address => mapping(string => string)))
        public TranscriptForStudents;

    function addNewTranscriptForClass(
        string memory _classroom,
        string memory _hashcode
    ) public {
        TranscriptForClass[_msgSender()][_classroom] = _hashcode;
        emit AddNewTranscriptForClass(_classroom, _hashcode);
    }

    function addNewTranscriptForStudents(
        StudentTranscript[] memory _studentTranscripts
    ) public {
        for (uint256 i = 0; i < _studentTranscripts.length; i++) {
            StudentTranscript memory studentTranscript = _studentTranscripts[i];
            TranscriptForStudents[_msgSender()][
                studentTranscript.StudentAddress
            ][studentTranscript.Classroom] = studentTranscript.HashCode;
        }
        emit AddNewTranscriptForStudents(_studentTranscripts);
    }
}
