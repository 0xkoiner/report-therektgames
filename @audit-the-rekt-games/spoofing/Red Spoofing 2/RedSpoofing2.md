# Red Spoofing 2 🔀 - 100 Points

Having successfully created a spoofed address that resembles the target receiver in the previous challenge, it’s time to move forward and complete the PoC.

In a real-world scenario, attackers may conduct a zero-token transfer to mimic a legitimate transaction and increase their credibility in the eyes of unsuspecting users. By copying all transaction details, except for the recipient address, attackers can simulate a seemingly authentic token transfer.

## Task

Now that you've generated a spoofed address, it's time to initiate the next step in this PoC of transaction spoofing.

Perform a 0-value token transfer in the tesnet. It should resemble the token transfer in the same transaction we saw in the first part:

`holesky-0x28e46dc92cd9a2df7776138d4a722ed474309569181e25465d2005a7090097a2`

The main difference will be the recipient address, which should now be an spoofed address (at least first and last 3 characters equal to the receiver), and the amount that should be 0.

Note: for this challenge you'll first need to get some Holesky ETH to pay for the gas of your transaction

## Flag

Once you successfully executed the 0-value token transfer in Holesky testnet, follow the instructions on this page to retrieve the flag:

https://therektgames-containers.vercel.app/redspoofing-2

# @Audit

### Send transaction `Function: transferFrom(address from,address to,uint256 amount)`

. Name Type Data
0 from address 0x31337357A04758b6EA1870Cef0880F20205ad523
1 to address 0x7d270758fBD98EC316dFC9d39D1e6EF5719df023
2 amount uint256 0

[Solution] - - tx: https://holesky.etherscan.io/tx/0x6ed87f5f433574a39392d32fcb327f06f8ca3dc2e458f86b94860a7898aa6343
