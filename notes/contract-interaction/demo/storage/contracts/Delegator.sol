pragma solidity ^0.5.0;

contract Delegator {
    bytes1    public val1;   // storage slot 0
    uint8     public val2;   // storage slot 0
    bool      public val3;   // storage slot 0   
    address   public val4;   // storage slot 0
    string    public val5;   // storage slot 1
    
    address public owner;    // storage slot 2
    address public delegate;  // contract to delegate calls to

    event LogResult(bytes result);

    constructor(address delegateAddress) public {
        owner = msg.sender;
        delegate = delegateAddress;
    }

    function setVersion(uint newVersion) public {
        bytes memory abiData = abi.encodeWithSignature("setVersion(uint256)", newVersion);
        (bool success, ) = delegate.delegatecall(abiData);
        require(success, "external call failed");
    }
}
