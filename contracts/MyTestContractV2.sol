// contracts/MyTestContract.sol
// Contract based on [https://docs.openzeppelin.com/contracts/3.x/erc721](https://docs.openzeppelin.com/contracts/3.x/erc721)
// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

import "@openzeppelin/contracts-upgradeable/access/AccessControlUpgradeable.sol";
import "@openzeppelin/contracts-upgradeable/access/OwnableUpgradeable.sol";
import "@openzeppelin/contracts-upgradeable/token/ERC721/extensions/ERC721PausableUpgradeable.sol";

contract MyTestContractV2 is ERC721PausableUpgradeable, AccessControlUpgradeable, OwnableUpgradeable {

    string private _baseURIextended;

    bytes32 public constant MINTER_ROLE = keccak256("MINTER_ROLE");
    bytes32 public constant PAUSER_ROLE = keccak256("PAUSER_ROLE");

    function initialize(address minter, address pauser) initializer public {
        __ERC721_init("MyTestContract", "NFT");
        __Ownable_init();
        _setupRole(DEFAULT_ADMIN_ROLE, msg.sender);
        _setupRole(MINTER_ROLE, minter);
        _setupRole(PAUSER_ROLE, pauser);
    }

    function supportsInterface(bytes4 interfaceId) public view virtual override(ERC721Upgradeable, AccessControlUpgradeable) returns (bool) {
        return super.supportsInterface(interfaceId);
    }

    function mintNFT(address _recipient, uint256 _newItemId) public onlyRole(MINTER_ROLE) returns (uint256)
    {
        // TODO: add _newItemId verification
        _safeMint(_recipient, _newItemId);
        return _newItemId;
    }

    function setBaseURI(string memory baseURI_) external onlyRole(DEFAULT_ADMIN_ROLE) {
        _baseURIextended = baseURI_;
    }

    function _baseURI() internal view virtual override returns (string memory) {
        return _baseURIextended;
    }

    function pause() public virtual onlyRole(PAUSER_ROLE) {
        _pause();
    }

    function unpause() public virtual onlyRole(PAUSER_ROLE) {
        _unpause();
    }

    function retrieveVersion() public pure returns (uint256) {
        return 2;
    }

}
