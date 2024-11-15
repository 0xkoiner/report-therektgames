from eth_account import Account
from datetime import datetime

start_timestamp = int(datetime(2008, 10, 31).timestamp())  

i = start_timestamp
while True:
    priv_key = f"{i:064x}"
    account = Account.from_key(priv_key)

    if account.address.lower().startswith("0xc0de"):
        print(f"Found address: {account.address}")
        print(f"Private Key: 0x{priv_key}")
        break
    i += 1
