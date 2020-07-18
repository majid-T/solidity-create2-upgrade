// SPDX-License-Identified: UNLICENSED

pragma solidity >0.4.0 <0.7.0;

contract Calldata {
    
    function getData(uint input) public view returns(bytes memory output) {
        assembly {
            let base := mload(0x40)
            mstore(add(base, 0x00),0x20) // 0x20 - 32 bytes
            mstore(add(base, 0x20), 36) // data length
            calldatacopy(add(base, 0x40), 0,36)
            return(base,0x80)
        }
    }
}

// 0x0178fe3f00000000000000000000000000000000000000000000000000000000000004d2

// 0x0178fe3f00000000000000000000000000000000000000000000000000000000000004d2