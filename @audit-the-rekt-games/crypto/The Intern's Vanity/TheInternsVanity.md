# The Intern's Vanity 🔑 (#1) - 30 Points

A new intern has joined The Red Guild's team.

Skipping the usual security onboarding, management needed a quick win and assigned the intern the first task: to generate a vanity wallet address starting with 0xc0de. This wallet will be used in the future to deploy the Guild's on-chain vault.

The intern delivered surprisingly quickly, and the deployment went ahead. But something feels off about how fast they accomplished this seemingly complex task...

## Files

https://github.com/theredguild/therektgames-archive/tree/main/guild-intern

## Task

Is the intern's wallet generation script safe? If you can uncover a security vulnerability and get the Guild wallet's private key, you'll earn the respect of the Guild.

## Flag

The wallet's private key. For example:

0x9bf1d24dc556910168f9a3c54db8d62deebff71820ee009531a51702700a27d0

# @Audit

1. The intern's script for vanity wallet generation appears to have a serious vulnerability related to its use of the Profanity tool. Profanity is known for creating Ethereum vanity addresses but has a significant flaw: it uses a 32-bit random vector as the seed for 256-bit private keys. This weak seeding process drastically reduces the entropy of the generated keys, making them vulnerable to brute-force attacks. In fact, there are existing tools, such as profanity-brute-force, designed specifically to exploit this flaw and recover private keys from addresses generated by Profanity.

2. To extract the private key, you could:
   Identify a signed transaction from the target wallet on Etherscan.
   Use the transaction to derive the public key.
   Employ the brute-force tool to reverse-engineer the private key using GPU acceleration.
   The Guild's vanity wallet starting with 0xc0de is likely compromised because the intern's quick delivery hints at the use of Profanity for rapid address generation, which is unsafe. This would allow you to retrieve the private key through the aforementioned method​.

`It looks like you have two JSON keystore files (redguild1 and redguild2). These files are encrypted and store the private keys for the Ethereum wallets. The next step involves decrypting these keystore files to retrieve the private keys.`

## Approach

#### a. Understand the File Format:

    The files are in JSON keystore format, commonly used for Ethereum wallets.
    They use aes-128-ctr encryption and scrypt as the key derivation function (KDF).
    The key parameters you will need:
    ciphertext: The encrypted private key.
    iv: Initialization vector for AES decryption.
    salt: Salt for the scrypt KDF.
    n, r, p: Parameters for the scrypt function.

#### b. Brute-Force the Password:

    If you do not have the password for the keystore files, you can attempt a brute-force or dictionary attack.
    Use tools like hashcat or John the Ripper that support Ethereum keystore cracking with scrypt.

#### C. Decrypt the Keystore File:

    If you know or crack the password, you can decrypt the file using Python with the eth-keyfile library or the Ethereum CLI tools like geth.

`The script you shared (vanity-wallet.js) reveals an important clue: it generates the wallet address using a predictable sequence of integers as private keys. The intern's code is not using a cryptographically secure random number generator. Instead, it simply increments a counter (i) starting from a timestamp and converts it to a private key using numberToHex.`

### Vulnerability Analysis

The main issue with this script is that it uses a deterministic and predictable approach:

1. The private key is derived from a counter (i), which starts from the current timestamp.
2. The counter increments in a loop until an address with the prefix 0xc0de is found.
   This means the private key can be easily brute-forced by replaying the same logic in the script, starting from the same timestamp (or a close range) and iterating until the correct address is found.

### Exploiting the Vulnerability

You can recreate the script and find the private key by following these steps:

1. Replicate the Intern’s Logic:
   Start from a Unix timestamp close to the date the script was likely run.
   Increment the counter and check each resulting private key until you find the address starting with 0xc0de.
   Python Script to Recover the Private Key
   Here’s a Python script that mimics the intern’s approach using the same timestamp-based counter:

   ##### Python Script to Recover the Private Key

   Here’s a Python script that mimics the intern’s approach using the same timestamp-based counter:

   ```
   pip install eth-account
   ```

   ```python
   from eth_account import Account
   from datetime import datetime

   # Start from the timestamp in the intern's script
   start_timestamp = int(datetime(2008, 10, 31).timestamp())  # Halloween date from script

   i = start_timestamp
   while True:
       # Convert the counter to a 32-byte hex string (private key)
       priv_key = f"{i:064x}"
       account = Account.from_key(priv_key)

       if account.address.lower().startswith("0xc0de"):
           print(f"Found address: {account.address}")
           print(f"Private Key: 0x{priv_key}")
           break
       i += 1
   ```

[Solution] - - After run the script got the private-key