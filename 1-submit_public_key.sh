#!/usr/bin/env bash
# Displays the public key for submission

# Define the location of the public key
pubkey_file="$HOME/.ssh/school.pub"

# Exit with an error if the public key cannot be found
if [[ ! -f "$pubkey_file" ]]; then
    echo "Error: Public key not found. Run 0-create_ssh_key_pair.sh first." >&2
    exit 1
fi

# Display the public key for copying
cat "$pubkey_file"
echo "REMINDER: Send ONLY this public key. Never share your private key."
