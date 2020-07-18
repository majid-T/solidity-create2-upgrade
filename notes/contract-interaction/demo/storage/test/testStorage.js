const Delegator = artifacts.require('Delegator');
const VersionLibrary = artifacts.require('VersionLibrary');
const ethers = require("ethers");

contract("ProxyDelegate", accounts => {
    let proxy;
    let lib;
    const owner = accounts[0];
    before(async() => {
       lib = await VersionLibrary.deployed();
       proxy = await Delegator.deployed(lib.address, {from: owner});
    });

    it("getStorageAt with storage index 2 should return owner address", () => {
        const version = 0xaabbccddeeff;
        return proxy.setVersion(version).then(tx => { 
             return web3.eth.getStorageAt(proxy.address, 2).then(result => {
               const checksumAddress = ethers.utils.getAddress(result);
               assert.equal(checksumAddress, owner, "owner mismatch");
             });
          });
    });
});
