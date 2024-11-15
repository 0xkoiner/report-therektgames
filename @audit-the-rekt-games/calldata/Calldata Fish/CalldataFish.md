# Calldata fish 🐟 - 75 Points

During the investigation of a phishing campaign, someone on X shared this calldata of an Ethereum transaction. They lost the tx hash, so it's hard to know more details. All we know is that it was flagged as an approval of a stablecoin by a monitoring system.

```
0x8fcbaf0c000000000000000000000000b4d44b2217477320c706ee4509a40b44e54bab850000000000000000000000000629b1048298ae9deff0f4100a31967fb3f989620000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000006907dbf70000000000000000000000000000000000000000000000000000000000000001000000000000000000000000000000000000000000000000000000000000001b99a694ae810fa810c9c6fc8fa039a3e021244e3c05909d674a400d82a15c0eb13a57e18015ba577966d250fa7f3ac45742a22df9e4c6bd914016b3470f12dcf6
```

## Task

Analyze the calldata to find out the token address and how many tokens the phishing victim could lose.

## Flag

The token address and how many tokens the phishing victim could lose, separated by a -.

# @Audit

Lets try to check all parts of calldata:

```
0x8fcbaf0c - permit(address,address,uint256,uint256,bool,uint8,bytes32,bytes32)
000000000000000000000000b4d44b2217477320c706ee4509a40b44e54bab85 - address 0xb4d44b2217477320c706ee4509a40b44e54bab85
0000000000000000000000000629b1048298ae9deff0f4100a31967fb3f98962 - address 0x0629b1048298ae9deff0f4100a31967fb3f98962
0000000000000000000000000000000000000000000000000000000000000000 - amount 0
000000000000000000000000000000000000000000000000000000006907dbf7 - deadline 1762122743 Sun Nov 02 2025 22:32:23 GMT+0000
0000000000000000000000000000000000000000000000000000000000000001 - bool 1/true
000000000000000000000000000000000000000000000000000000000000001b - v
99a694ae810fa810c9c6fc8fa039a3e021244e3c05909d674a400d82a15c0eb1 - r
3a57e18015ba577966d250fa7f3ac45742a22df9e4c6bd914016b3470f12dcf6 - s
```

1. Checking the sig of the function (the first 4 bytes) 0x8fcbaf0c. I used with www.4byte.directory.
   @audit - https://www.4byte.directory/signatures/?bytes4_signature=0x8fcbaf0c

   What is permit?
   The permit function is part of the ERC20 Permit extension, as defined in EIP-2612. It enables token approvals via signatures, allowing a user to approve a spender without having to perform an on-chain transaction themselves.

   ## Conclusion

   This setup creates a complete solution for handling ERC20 permit transactions in a React frontend with a Node.js backend. Users can connect their wallet, sign a permit transaction using MetaMask, and the backend will handle sending the signed transaction to the Ethereum network. This allows for gasless transactions where the backend server pays for the gas fees.

2. These are the official ERC-20 contract addresses for USDC and DAI on the Ethereum network. Make sure to only interact with these verified contracts to avoid potential scams or phishing attacks.

   #### USDC (USD Coin)

   #### USDC Contract Address (Ethereum Mainnet):

   #### Address: 0xA0b86991C6218B36c1d19D4a2e9Eb0Ce3606eB48

   #### Token Symbol: USDC

   #### DAI (Dai Stablecoin)

   #### DAI Contract Address (Ethereum Mainnet):

   #### Address: 0x6B175474E89094C44Da98b954EedeAC495271d0F

   #### Token Symbol: DAI

3. Given that the approval value is 0 and allowed is True, this looks like an infinite approval. If the victim used a stablecoin like USDC!!!

[Solution] - - 0x6B175474E89094C44Da98b954EedeAC495271d0F-115792089237316195423570985008687907853269984665640564039457584007913129639935
