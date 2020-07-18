pragma solidity ^0.5.0;

contract VersionLibrary {
    uint public version = 1;

    function setVersion(uint newVersion)   public {
        version = newVersion;
    }
}
