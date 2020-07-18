// const ethereumjs = require("ethereumjs-util");
// recipient is the address that should be paid.
// amount, in wei, specifies how much ether should be sent.
// nonce can be any unique number, used to prevent replay attacks.
// contractAddress is used to prevent cross-contract replay attacks.
// function signPayment(recipient, amount, nonce, contractAddress, callback) {
//     var hash = "0x" + ethereumjs.ABI.soliditySHA3(
//       ["address", "uint256", "uint256", "address"],
//       [recipient, amount, nonce, contractAddress]
//     ).toString("hex");
//   console.log(hash);
//     // web3.personal.sign(hash, web3.eth.defaultAccount, callback);
//   }

// signPayment("0x152D05F008943d39f680A48EeD25e9f56bb74218",5000000000,0,"0xE207F1bE8775A47bbC0E7d7aeb19f8195bF9C0e4");

// https://web3js.readthedocs.io/en/v1.2.9/web3-utils.html#soliditysha3
// web3.utils.soliditySha3({t: 'string', v: 'Hello!%'}, {t: 'int8', v:-23}, {t: 'address', v: '0x85F43D8a49eeB85d32Cf465507DD71d507100C1d'});
const web3Utils = require("web3-utils");
const Web3 = require("web3");
const web3 = new Web3();
async function signPayment(recipient, amount, nonce, contractAddress) {
  // https://web3js.readthedocs.io/en/v1.2.7/web3-utils.html#soliditysha3
  var hash = web3Utils.soliditySha3(
    { t: "address", v: recipient },
    { t: "uint256", v: amount },
    { t: "uint256", v: nonce },
    { t: "address", v: contractAddress }
  );
  return hash;
}

signPayment(
  "0x152D05F008943d39f680A48EeD25e9f56bb74218",
  5000000000,
  0,
  "0xE207F1bE8775A47bbC0E7d7aeb19f8195bF9C0e4"
).then((message) => {
  const sKey = "f4562dc9ba347f4a57384d2fc857cf65d8e87bba18bbb2ceaf7f2691a05d0859";
  // https://web3js.readthedocs.io/en/v1.2.7/web3-eth-accounts.html#sign
  const sig = web3.eth.accounts.sign(message,sKey);
  console.log(sig);
})
