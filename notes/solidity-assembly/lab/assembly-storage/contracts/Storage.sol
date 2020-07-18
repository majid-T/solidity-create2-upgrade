pragma solidity >0.5.0;

contract Storage {
    bytes4  bytes4data = 0xaabbccdd;
    uint72  uintdata = 0x123456;
    bool    booldata = true;
    address addrdata = 0xdC962cEAb6C926E3a9B133c46c7258c0E371b82b;

    function getData() public view returns (bytes4 output1,uint64 output2,bool output3,address output4) {
        assembly {
            // return the values of bytes4data, uintdata, booldata, addrdata
            let data := sload(bytes4data_slot)
            output1 := shl(224,and(data,0xffffffff))
            output2 := shr(shl(3,uintdata_offset), data)
        }
    }
}
// 0x0000000000000000000000000000000000000000000000000000000000000000 => one storage slot
// first slot
// 0x00000000000000000000000000000000000001000000000000123456aabbccdd  => first slot
// 0x00000000000000000000000000000000000000000000000000000000ffffffff
// 0x00000000000000000000000000000000000000000000000000000000aabbccdd
// after shifting left 224 times
// 0xaabbccdd00000000000000000000000000000000000000000000000000000000
// 0xaabbccdd
// -> bytes4data_slot
// -> uintdata_slot
// -> booldata_slot
// second slot
// 0x000000000000000000000000dC962cEAb6C926E3a9B133c46c7258c0E371b82b => second slot
// -> addrdata_slot

// 0x0000000000000000000000000000000000000000000000000000000000000000 -> bytes4data_offsset (4 bytes)
// 0x0000000000000000000000000000000000000000000000000000000000000004 -> uintdata_offset 
// left shift 3 bits
// 0x0000000000000000000000000000000000000000000000000000000000000020 -> 32 -> result of uintdata_offset when left shift by 3
// 0x00000000000000000000000000000000000000000000000000000000000000C0 -> booldata_offset
// -------------------------new slot -------------------------------
// 0x0000000000000000000000000000000000000000000000000000000000000000 -> addrdata_offset

// 0x00000000000000000000000000000000000001000000000000123456aabbccdd right by 32 bits

// 0x00000000000000000000000000000000000000000000001000000000000123456