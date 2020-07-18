# ASSIGNMENT: 
Create Your Own Private Network And Mine Some Ether

Hi there,

so now you know the different blockchain nodes and also how to create your own private network.

Now it's time to put the lessons learned into a practical assignment.

First you need to download and install geth. Geth can be downloaded from here: https://geth.ethereum.org/downloads/

### LINUX/UBUNTU USERS:

You can also install geth directly:

```bash
sudo apt-get install software-properties-common`
```
```bash
sudo add-apt-repository -y ppa:ethereum/ethereum
```
```bash
sudo apt-get update
```
```bash
sudo apt-get install geth
```

### MAC OS USERS:

You don't need to use Homebrew to install Geth. Just unzip the archive for Mac OS. The executables just run in place. Do the following.

1. Unzip the Geth archive in your `~/Applications` folder (not my system `/Applications` folder).

2. Rename the resulting folder to `~/Applications/geth-1.7.0` (or to your version number).

3. Create a soft link to it. CD to the `~/Applications` folder and run: `ln -s geth-1.7.0 geth`

4. Add the `~/Application/geth` folder to your `PATH`.

5. Update geth to a newer version, for example `geth-1.7.1`? Download and expand it like above. So now you have inside your `~/Applications` directory:

`geth-1.7.0` (after renaming the expanded archive)

`geth-1.7.1` (after renaming the expanded archive)

`geth` (which is a soft link to `geth-1.7.0`).

6. Switch the softlink to use the new Geth. `rm geth; ln -s geth-1.7.1 geth`

Note that you have to restart your command window after step 4. But not after step 6.

### WINDOWS USERS:

Download the Installer, follow the wizard.

Geth is a Go-Implementation of the Ethereum Protocol. At the time of writing it does not feature any automatic update mechanism, so it's good to check from time to time for newer versions.

After downloading Geth, you also need to have your very own `genesis.json` file. 
It should look like this:

```json
{
  "config": 
  {
		"chainId": 33,
		"homesteadBlock": 0,
		"eip150Block":0,
		"eip155Block": 0,
		"eip158Block": 0
	},
	"nonce": "0x0000000000000033",
	"timestamp": "0x0",
	"parentHash": "0x0000000000000000000000000000000000000000000000000000000000000000",
	"gasLimit": "0x8000000",
	"difficulty": "0x100",
	"mixhash": "0x0000000000000000000000000000000000000000000000000000000000000000",
	"coinbase": "0x3333333333333333333333333333333333333333",
	"alloc": {}
}
```
Let's open a console now and and get started in a new, empty folder. Let's call this folder `assignment_1` and currently there is nothing inside. Follow these steps:

- Save the  genesis.json   file inside the folder `assignment_1`
- Open a Terminal/Console/PowerShell window and go to the folder `assignment_1`
- Create a new folder called `chaindata` inside `assignment_1` - don't go inside that folder
- You have now inside the `assignment_1` folder another folder called `chaindata` and the `genesis.json` file. And the Terminal is still open. Now, let's initialize a private chain inside that folder. Type in

 ```bash
 geth --datadir=./chaindata init ./genesis.json 
 ```

- You should see something like this output:

```bash
$ geth --datadir=./chaindata/ init ./genesis.json
```
```bash
WARN [09-16|09:10:44] No etherbase set and no accounts found as default
INFO [09-16|09:10:44] Allocated cache and file handles         database=D:\\Dropbox\\Projects\\ethereum3-exchange\\sample\\chaindata\\geth\\chaindata cache=16 handles=16
INFO [09-16|09:10:44] Writing custom genesis block
INFO [09-16|09:10:44] Successfully wrote genesis state         database=chaindata                                                                     hash=9b8d4a…9021ba
INFO [09-16|09:10:44] Allocated cache and file handles         database=D:\\Dropbox\\Projects\\ethereum3-exchange\\sample\\chaindata\\geth\\lightchaindata cache=16 handles=16
INFO [09-16|09:10:44] Writing custom genesis block
INFO [09-16|09:10:44] Successfully wrote genesis state         database=lightchaindata                                                                     hash=9b8d4a…9021ba
```
Then geth stops. So now you have initialized your private chain inside the chaindata directory. There are no files written somewhere else. As long as geth is not running you can freely move the files around, it's a completely self-contained file-based database of the blockchain (your private chain).

You now have to start geth with that chaindata directory:

```bash
geth --datadir=./chaindata
```

Eventually you will need an additional flag `--nodiscover` when you start `geth`.

It should start and you should see two lines to pay special attention to.

First, it should output the config somewhere. This should contain the same ChainID as you have in your genesis.json file:

```bash
INFO [09-16|09:13:56] Initialised chain configuration config="{ChainID: 15 Homestead: 0 DAO: <nil> DAOSupport: false EIP150: <nil> EIP155: 0 EIP158: 0 Metropolis: <nil> Engine: unknown}" 
```

### MAC/LINUX USERS: 
The second line to pay attention to is the line of the `geth.ipc` file, which will be necessary in the next sections:

```bash
INFO [09-16|09:13:59] IPC endpoint opened: /some/directory/chaindata/chaindata/geth.ipc 
```

This works so far then you have successfully completed this assignment.
