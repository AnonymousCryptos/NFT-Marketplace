// SPDX-License-Identifier: MIT
pragma solidity ^0.8.17;

import "@openzeppelin/contracts-upgradeable/token/ERC1155/ERC1155Upgradeable.sol";
import "@openzeppelin/contracts-upgradeable/access/OwnableUpgradeable.sol";
import "@openzeppelin/contracts-upgradeable/security/ReentrancyGuardUpgradeable.sol";
import "../interfaces/ICollection.sol";

contract BaseCollection is 
    ERC1155Upgradeable, 
    OwnableUpgradeable, 
    ReentrancyGuardUpgradeable,
    ICollection 
{
    string public name;
    string public description;
    address public marketplace;
    
    uint256 private _tokenIds;
    mapping(uint256 => NFTDetails) private _nftDetails;

    function initialize(
        string memory _name,
        string memory _description,
        address _owner,
        address _marketplace
    ) public initializer {
        require(bytes(_name).length > 0, "Invalid name");
        require(bytes(_description).length > 0, "Invalid description");
        require(_owner != address(0), "Invalid owner");
        require(_marketplace != address(0), "Invalid marketplace");

        __ERC1155_init("");
        __Ownable_init();
        __ReentrancyGuard_init();
        
        name = _name;
        description = _description;
        marketplace = _marketplace;
        
        transferOwnership(_owner);
    }

    function createNFT(
        string memory _tokenURI,
        uint256 maxSupply,
        uint256 royaltyPercentage
    ) public virtual override onlyOwner returns (uint256) {
        require(maxSupply > 0, "Invalid max supply");
        require(royaltyPercentage <= 1000, "Royalty too high"); // Max 10%

        _tokenIds++;
        uint256 newTokenId = _tokenIds;

        _nftDetails[newTokenId] = NFTDetails({
            uri: _tokenURI,
            maxSupply: maxSupply,
            creator: msg.sender,
            royaltyPercentage: royaltyPercentage
        });

        // Mint all NFTs to creator immediately
        _mint(msg.sender, newTokenId, maxSupply, "");

        emit NFTCreated(newTokenId, msg.sender, maxSupply);
        return newTokenId;
    }

    function nftDetails(uint256 tokenId) external view virtual returns (NFTDetails memory) {
        return _nftDetails[tokenId];
    }

    function uri(uint256 tokenId) public view virtual override returns (string memory) {
        return _nftDetails[tokenId].uri;
    }
}