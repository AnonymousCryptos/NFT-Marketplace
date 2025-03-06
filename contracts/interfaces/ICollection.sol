// SPDX-License-Identifier: MIT
pragma solidity ^0.8.17;

interface ICollection {
    struct NFTDetails {
        string uri;
        uint256 maxSupply;
        address creator;
        uint256 royaltyPercentage;
    }

    event NFTCreated(uint256 indexed tokenId, address indexed creator, uint256 maxSupply);

    function initialize(
        string memory name,
        string memory description,
        address owner,
        address marketplace
    ) external;

    function createNFT(
        string memory _tokenURI,
        uint256 maxSupply,
        uint256 royaltyPercentage
    ) external returns (uint256);

    function nftDetails(uint256 tokenId) external view returns (NFTDetails memory);
}