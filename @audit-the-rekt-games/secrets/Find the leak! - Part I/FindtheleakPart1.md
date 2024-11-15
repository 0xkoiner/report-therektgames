# Find the leak! - Part I 🙊 - 50 Points

We have been hired by the Ethereum Foundation to do an assessment on what appears to be a leak inside some of their repos.

They suspect some devs mistakenly submitted some sensitive data into the geth’s repository (go-ethereum), but couldn’t figure out where, and if it is an isolated case or not.

We have forked it under theredguild/goat-ethereum, so go and take a look, see what you can find.

So far, they identified a mnemonic / seed phrase consisting of 12 words. Can you help them find it?

https://github.com/theredguild/goat-ethereum

# @Audit

`The value you found in .env appears to be base64-encoded. Let’s decode it and see what it contains.`

### Decode the Base64 String

In the .env file, you found the following value:

```
PK=c2VjcmV0IGFwZSBmb3Jnb3Qgc2VlZCBwaHJhc2Ugbm93IHdhbGxldCByZWt0IGhhY2tlcnMgbGF1Z2ggd2ViMyBzZWN1cml0eSBmYWlscw==
```

The part after PK= is Base64-encoded. To decode it, follow these steps:

#### Option 1: Using base64 Command in Linux/MacOS

```bash
echo "c2VjcmV0IGFwZSBmb3Jnb3Qgc2VlZCBwaHJhc2Ugbm93IHdhbGxldCByZWt0IGhhY2tlcnMgbGF1Z2ggd2ViMyBzZWN1cml0eSBmYWlscw==" | base64 -d
```

#### Option 2: Using base64 Command in Windows (PowerShell)

```powershell
[System.Text.Encoding]::UTF8.GetString([System.Convert]::FromBase64String("c2VjcmV0IGFwZSBmb3Jnb3Qgc2VlZCBwaHJhc2Ugbm93IHdhbGxldCByZWt0IGhhY2tlcnMgbGF1Z2ggd2ViMyBzZWN1cml0eSBmYWlscw=="))
```

#### Option 3: Using Python Script

If you have Python installed, you can decode it with:

```python
import base64

encoded = "c2VjcmV0IGFwZSBmb3Jnb3Qgc2VlZCBwaHJhc2Ugbm93IHdhbGxldCByZWt0IGhhY2tlcnMgbGF1Z2ggd2ViMyBzZWN1cml0eSBmYWlscw=="
decoded = base64.b64decode(encoded).decode()
print(decoded)
```

[Solution] - - `secret` `ape` `forgot` `seed` `phrase` `now` `wallet` `rekt` `hackers` `laugh` `web3` `security` `fails`
