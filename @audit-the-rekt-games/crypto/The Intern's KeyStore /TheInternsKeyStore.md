# The Intern's KeyStore 🔑 (#3) - 50 Points

Third time's the charm? Not for our intern. After multiple security blunders, The Red Guild finally intervened, providing two secure private keys for their multisig wallet.

Our security-conscious (but still green) intern decided to add an "extra layer of protection" by encrypting the keys in keystore format.

However, in a classic rookie move, he accidentally leaked the keystores folder online.

`"No worries," said, "it's encrypted after all!"`

## Files

https://github.com/theredguild/therektgames-archive/tree/main/guild-intern-keystore

## Task

Crack the keystores encryption and retrieve both private keys. Show the intern why encryption is only as strong as its weakest link.

## Flag

The private keys separated with a -.

For example: 0x3d2b5f39a5a425110a4ac8333794b4eb9db5d80b4cb652fb03b9f57cd96f438a-0xcbe2584036801cfd0d5664c466d85b9af865dbd8d9f685deff5ad1cf70eb83c7

# @Audit

## Task Breakdown

    The challenge involves cracking two keystore files and extracting private keys that are encrypted with a password. This is similar to the previous task but with a higher level of complexity due to the encryption parameters (scrypt with higher n values). Here’s our plan:

    1. Analyze the Keystore Files: We have two keystores (redguild1 and redguild2). We need to try decrypting them using a password cracking approach since no password is provided.

    2. Identify Possible Weak Passwords: The intern’s previous mistakes might hint at using weak or default passwords (like "password", "123456", etc.).

    3. Cracking Method: We’ll use a brute-force or dictionary attack using Python and the eth_keyfile package.

    4. Extract the Keys and Format the Flag: Once decrypted, combine the private keys with a dash as per the task requirements.

#### Strategy

Given the intern’s repeated blunders, they might have used simple passwords. We’ll:

• Attempt common weak passwords.
• Automate the process with a script.
Let’s write a Python script for this.

```bash
pip install eth-keyfile
```

```python
import json
from eth_keyfile import decode_keyfile_json

# List of possible weak passwords to try
passwords = [
    "password", "123456", "letmein", "guild123", "qwerty", "intern123",
    "redguild", "test", "admin", "welcome"
]

# Function to attempt decryption
def try_decrypt(keystore_path):
    with open(keystore_path, "r") as f:
        keystore = json.load(f)

    for password in passwords:
        try:
            private_key = decode_keyfile_json(keystore, password.encode())
            print(f"Success! Private Key: 0x{private_key.hex()}")
            return private_key.hex()
        except ValueError:
            continue

    print(f"Failed to decrypt {keystore_path}")
    return None

# Paths to the keystore files
keystore1 = "guild-intern-keystore/redguild1"
keystore2 = "guild-intern-keystore/redguild2"

# Attempt decryption
key1 = try_decrypt(keystore1)
key2 = try_decrypt(keystore2)

if key1 and key2:
    flag = f"0x{key1}-0x{key2}"
    print(f"Flag: {flag}")
else:
    print("Could not retrieve both keys.")

```

[Solution] - - Successfuly i was cracked only the redguild1 keystore with default passwork `123456`. For `keystore2` i had not enough time to brute-force the password.

[Hint] - - Try the ethbrute tool. https://github.com/eugenioclrc/ethbrute
