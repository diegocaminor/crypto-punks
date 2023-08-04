// SPDX-License-Identifier: MIT

pragma solidity ^0.8.0;

import "@openzeppelin/contracts/token/ERC721/ERC721.sol";
import "@openzeppelin/contracts/token/ERC721/extensions/ERC721Enumerable.sol";
import "@openzeppelin/contracts/utils/Counters.sol";

contract CryptoPunks is ERC721, ERC721Enumerable {
    using Counters for Counters.Counter;
    uint256 public maxSupply;

    Counters.Counter private _idCounter;

    constructor(uint256 _maxSupply) ERC721("CryptoPunks", "CRPTPKS") {
        maxSupply = _maxSupply
    }

    function mint(address to, uint256 amount) public {
        uint256 current = _idCounter.current();
        require(current < maxSupply, "No more CryptoPunks left D':")
        _safeMint(msg.sender, current);
    }

    // The following functions are overrides required by Solidity.
    function _beforeTokenTransfer(address from, address to, uint256 tokenId, uint256 batchSize)
        internal
        override(ERC721, ERC721Enumerable)
    {
        super._beforeTokenTransfer(from, to, tokenId, batchSize);
    }

    function supportsInterface(bytes4 interfaceId)
        public
        view
        override(ERC721, ERC721Enumerable)
        returns (bool)
    {
        return super.supportsInterface(interfaceId);
    }
}