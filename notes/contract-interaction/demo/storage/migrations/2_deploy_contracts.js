const Delegator = artifacts.require('Delegator');
const VersionLibrary = artifacts.require('VersionLibrary');

module.exports = function(deployer) {
    deployer.deploy(VersionLibrary)
    .then(() => deployer.deploy(Delegator, VersionLibrary.address));
}
