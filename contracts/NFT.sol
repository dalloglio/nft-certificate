// SPDX-License-Identifier: ISC
pragma solidity ^0.8.20;

import "@openzeppelin/contracts/token/ERC1155/ERC1155.sol";
import "@openzeppelin/contracts/access/Ownable.sol";
import "@openzeppelin/contracts/utils/Strings.sol";

contract NFT is ERC1155, Ownable {
    using Strings for uint256;

    uint256 public constant COURSE_CERTIFICATE = 1;

    struct Certificate {
        string studentName;
        string courseName;
        string completionDate;
        string institution;
        uint256 duration;
    }

    mapping(uint256 => Certificate) public certificates;

    mapping(address => uint256[]) public ownedCertificates;

    event CertificateMinted(
        address indexed recipient,
        uint256 tokenId, 
        string studentName,
        string courseName,
        string completionDate
    );

    constructor(address initialOwner)
        ERC1155("http://localhost:3000/certificates/{id}.json")
        Ownable(initialOwner)
    {}

    function mintCertificate(
        address recipient, 
        uint256 amount,
        string memory studentName,
        string memory courseName,
        string memory completionDate,
        string memory institution,
        uint256 duration
    ) public onlyOwner {
        uint256 tokenId = COURSE_CERTIFICATE;
        _mint(recipient, tokenId, amount, "");
        certificates[tokenId] = Certificate(studentName, courseName, completionDate, institution, duration);
        ownedCertificates[recipient].push(tokenId);
        emit CertificateMinted(recipient, tokenId, studentName, courseName, completionDate);
    }

    function uri(uint256 tokenId) public pure override returns (string memory)
    {
        return string(
            abi.encodePacked(
                "http://localhost:3000/certificates/",
                tokenId.toString(),
                ".json"
            )
        );
    }

    function getOwnedCertificates(address owner) public view returns (uint256[] memory)
    {
        return ownedCertificates[owner];
    }
}
