//// SPDX-License-Identifier: MIT
pragma solidity 0.8.4;


abstract contract AbstractAuctionFactory {
    function createAuction() external payable virtual;

    function bidNFT() external payable virtual {}

    function withdrawByCreater() external payable virtual {}

    function withdrawByBidder() external payable virtual {}

    function joinNetwork() external payable virtual {}
}
