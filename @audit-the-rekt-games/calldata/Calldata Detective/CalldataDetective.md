# Calldata Detective 🕵️ - 10 Points

As a member of a prominent DAO's multisig, you've just received an urgent email from a fellow council member:<br></br>
`"Hey! We need your signature ASAP for this routine maintenance transaction.` <br></br>
`Nothing major, just some standard updates. Could you sign it right away?"`

The transaction's calldata looks innocent enough: 0xf2fde38b000000000000000000000000098b716b8aaf21512996dc57eb0615e2383e2f96

But something feels off about the urgency. Before blindly signing, maybe you should decode what this transaction actually does...

## Task

Decode the transaction's calldata to reveal its true purpose. What exactly are you being asked to sign?

## Flag

A human-readable description of the function call, like: transfer(0xd8dA6BF26964aF9D7eEd9e03E53415D37aA96045,1000)

# @Audit

Lets try to check all parts of calldata:

```
0xf2fde38b -> 743	transferOwnership(address)	0xf2fde38b
000000000000000000000000098b716b8aaf21512996dc57eb0615e2383e2f96 -> address 0x098b716b8aaf21512996dc57eb0615e2383e2f96
```

1. Checking the sig of the function (the first 4 bytes) 0xf2fde38b. I used with www.4byte.directory.
   @audit - https://www.4byte.directory/signatures/?bytes4_signature=0xf2fde38b | The function seems as transferOwnership.

   What is Ownership Transfer?
   Ownership Transfer is the act of moving control or authority over a smart contract or certain features within it from one entity to another. This ownership transfer is frequently a crucial component of decentralized apps, allowing for the easy management and administration of resources used in smart contracts.

   ## Security Considerations

   The security consequences of ownership transfer must be carefully considered before implementation. It is recommended that smart contract developers follow best practices in order to reduce risks related to denial of service attacks, privilege escalation, and unapproved ownership transfers.

[Solution] - - transferOwnership(address)
