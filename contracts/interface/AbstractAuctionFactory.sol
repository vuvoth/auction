//// SPDX-License-Identifier: MIT
pragma solidity 0.8.4;

import "@openzeppelin/contracts/token/ERC777/IERC777.sol";

abstract contract AbstractAuctionFactory {
	function buy() external virtual payable{
	}
}