// SPDX-License-Identifier: MIT
pragma solidity 0.8.4;

import "./BurntNFT.sol";

/**
 * @dev ERC721 - NFT token factory, use for create nft, mint a new token.
 */
contract NFTFactory {
    event NFTCreated(address creator, address nftAddress, uint256 supply);

    address public admin;

    /**
     * @param _admin - who can mint new token
     */
    constructor(address _admin) {
        admin = _admin;
    }

    function _createNFT(
        string memory _name,
        string memory _symbol,
        uint256 _totalSupply
    ) private returns (address) {
        return address(new BurntNFT(admin, _name, _symbol, _totalSupply));
    }

    function createNFT(
        string memory _name,
        string memory _symbol,
        uint256 _totalSupply
    ) external {
        require(msg.sender == admin, "Caller is not admin");

        address nftAddress = _createNFT(_name, _symbol, _totalSupply);
        emit NFTCreated(msg.sender, nftAddress, _totalSupply);
    }
}
