// SPDX-License-Identifier: ISC
pragma solidity ^0.8.20;

import "@openzeppelin/contracts/token/ERC1155/ERC1155.sol";
import "@openzeppelin/contracts/access/Ownable.sol";
import "@openzeppelin/contracts/utils/Strings.sol";

contract NFT is ERC1155, Ownable {
    using Strings for uint256;

    uint256 public constant COURSE_CERTIFICATE = 1;

    constructor(address initialOwner)
        ERC1155("http://localhost:3000/certificates/{id}.json")
        Ownable(initialOwner)
    {}

    function mintCertificate(address recipient, uint256 amount) public onlyOwner
    {
        _mint(recipient, COURSE_CERTIFICATE, amount, "");
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
}
