// SPDX-License-Identifier: MIT

pragma solidity 0.8.4;

import "@openzeppelin/contracts/token/ERC721/extensions/ERC721Enumerable.sol";

/**
 * @dev nft contract follow law of Burnt NFT platform
 */
contract BurntNFT is ERC721Enumerable {
    address minter;
    uint256 public burntTotalSupply;

    constructor(
        address _minter,
        string memory _name,
        string memory _symbol,
        uint256 _totalSupply
    ) ERC721(_name, _symbol) {
        burntTotalSupply = _totalSupply;
        minter = _minter;
    }

    /**
     * @dev mint a new token for `receiver`
     */
    function mintToken(address receiver) external {
        require(_msgSender() == minter, "Caller is not minter");
        require(totalSupply() < burntTotalSupply, "Bound out limited");

        uint256 tokenId = totalSupply();
        _safeMint(receiver, tokenId);
    }
}
