// SPDX-License-Identifier: ISC
pragma solidity ^0.8.20;

import "@openzeppelin/contracts/token/ERC1155/ERC1155.sol";
import "@openzeppelin/contracts/access/Ownable.sol";
import "@openzeppelin/contracts/utils/Strings.sol";

contract NFTBlockchainCertificate is ERC1155, Ownable {
    using Strings for uint256;

    uint256 public constant TOKEN_ID = 1;

    struct Certificate {
        string studentName;
        string courseName;
        string completionDate;
    }

    // Certificate[] private certificates;

    mapping(address => uint256) private certificates;

    mapping(address => uint256) private minted;

    mapping(address => uint256) private rewards;

    event CertificateMinted(
        address indexed student,
        uint256 tokenId,
        string studentName,
        string courseName,
        string completionDate
    );

    constructor(
        address initialOwner
    ) ERC1155("http://localhost:3000/certificates/{id}.json") Ownable(initialOwner) {}

    function mintCertificate(
        address student,
        string memory studentName,
        string memory courseName,
        string memory completionDate
    ) public onlyOwner {
        require(bytes(studentName).length > 0, "Student name must be provided");
        require(bytes(courseName).length > 0, "Course name must be provided");
        require(bytes(completionDate).length > 0, "Completion date must be provided");

        _mint(student, TOKEN_ID, 1, "");

        certificates[student] = TOKEN_ID;

        minted[student] += 1;

        uint256 currentMinted = minted[student];

        if (currentMinted == 1) {
            rewards[student] += 10;
        } else if (currentMinted >= 1 && currentMinted <= 5) {
            rewards[student] += 20;
        } else {
            rewards[student] += 50;
        }

        emit CertificateMinted(student, TOKEN_ID, studentName, courseName, completionDate);
    }

    function uri(uint256 tokenId) public pure override returns (string memory) {
        return
            string(
                abi.encodePacked("http://localhost:3000/certificates/", tokenId.toString(), ".json")
            );
    }

    function getStudentRewards(address student) public view returns (string memory) {
        return rewards[student].toString();
    }
}
