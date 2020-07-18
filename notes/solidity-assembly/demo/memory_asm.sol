// SPDX-License-Identified: UNLICENSED

pragma solidity >0.4.0 <0.7.0;

contract Sample {
    function getData(uint value) public view returns (bytes32 output) {
        assembly {
            function allocate(length) -> pos {
                let freePointer := 0x40
                pos := mload(freePointer)
                mstore(freePointer, add(pos,length))
            }
            let dataSize := 0x20 // 32 bytes
            let offset := allocate(dataSize)
            mstore(offset, value)
            return (offset, dataSize)
        }
    }
}

// 0x0178fe3f000000000000000000000000000000000000000000000000000000007fffffff

// 2147483647 => 0x000000000000000000000000000000000000000000000000000000007fffffff