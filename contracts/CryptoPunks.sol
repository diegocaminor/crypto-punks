// SPDX-License-Identifier: MIT

pragma solidity ^0.8.0;

import "@openzeppelin/contracts/token/ERC721/ERC721.sol";
import "@openzeppelin/contracts/token/ERC721/extensions/ERC721Enumerable.sol";
import "@openzeppelin/contracts/utils/Counters.sol";
// import "@openzeppelin/contracts/utils/Base64.sol";
import "./Base64.sol";
import "./CryptoPunksDNA.sol";

contract CryptoPunks is ERC721, ERC721Enumerable {
    using Counters for Counters.Counter;
    uint256 public maxSupply;

    Counters.Counter private _idCounter;

    constructor(uint256 _maxSupply) ERC721("CryptoPunks", "CRPTPKS") {
        maxSupply = _maxSupply;
    }

    function mint() public {
        uint256 current = _idCounter.current();
        require(current < maxSupply, "No more CryptoPunks left D':");
        _safeMint(msg.sender, current);
    }

    function tokenURI(uint256 tokenId)
        public
        view
        override
        returns(string memory)
    {
        require(
            _exists(tokenId),
            "ERC721 Metadata: URI query for nonexistent token"
        );

        string memory jsonURI = Base64.encode(
            abi.encodePacked(
                '{ "name": "CryptoPunks #',
                tokenId,
                '", "description": "Crypto Punks are randomized Avataaars stored on chain to teach DApp development", "image": "',
                "// TODO: Calculate image URL",
                '"}'
            )
        );
        return string(abi.encodePacked("data:application/json;base64,", jsonURI));
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