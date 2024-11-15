import json
from eth_keyfile import decode_keyfile_json

with open("redguild1", "r") as f:
    keystore = json.load(f)

password = "123456".encode()

try:
    private_key = decode_keyfile_json(keystore, password)
    print(f"Private Key: 0x{private_key.hex()}")
except ValueError as e:
    print("Incorrect password or decryption failed:", e)