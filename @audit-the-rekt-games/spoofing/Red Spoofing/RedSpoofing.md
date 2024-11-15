# Red Spoofing 🔀 - 50 Points

These days scams and phishing attacks are becoming increasingly popular. So it's fundamental for security researchers to understand all the evil techniques attackers are using to do it.

In this case, a client you work for doesn't believe scams are so dangerous. So he's asked you to see a practical example of how transaction spoofing works.

## Task

The client transferred a test token to another account. You must generate an address that starts and ends with 3 characters of the token receiver. Here's the transaction:

`holesky-0x28e46dc92cd9a2df7776138d4a722ed474309569181e25465d2005a7090097a2`

For example if the receiver is 0xd8dA6BF26964aF9D7eEd9e03E53415D37aA96045, the first 3 and last 3 characters would be `d8d` and `045.`

## Flag

For this challenge, you must generate the flag by following the instructions on this page:

https://therektgames-containers.vercel.app/redspoofing

# @Audit

In this task, asked to generate a spoofed Ethereum address based on the receiver's address from the given transaction. Let's break down the steps and solve it.

### Step 1: Analyze the Transaction

The transaction link provided is on the Holesky testnet: Holesky Etherscan Transaction

You need to check the receiver address of this transaction.

How to Find the Receiver
i. Open the Etherscan link above.
ii. Look at the "To" field of the transaction to find the receiver address.

### Step 2: Extract Receiver's Address Prefix and Suffix

Let's assume the receiver’s address is:
`0x1234567890abcdef1234567890abcdef12345678`
In this case:

- The first 3 characters after 0x are: 123
- The last 3 characters are: 678

### Step 3: Generate a Spoofed Address

You need to generate an Ethereum address that:

- Starts with the first 3 characters of the receiver (123 in this example).
- Ends with the last 3 characters of the receiver (678 in this example).

To achieve this, you need to brute-force Ethereum addresses using tools like vanity-eth.

### Step 4: Use a Vanity Address Generator

You can use a tool like Vanity-ETH or install it locally. (https://vanity-eth.tk)

[Solution] - - `address: 0x7d2f41720FCdaC9b4d398Dc59BA1389e3Aa660230x7d2023`
