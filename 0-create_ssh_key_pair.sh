#!/usr/bin/env bash
# Creates an RSA key pair

# Define the key name, location and passphrase
key_name="school"
key_dir="$HOME/.ssh"
key_path="$key_dir/$key_name"
key_passphrase="betty"

mkdir -p "$key_dir"
chmod u=rwx,go= "$key_dir"

# Check if the key already exists
if [[ -e "$key_path" || -e "$key_path.pub" ]]; then
    echo "Error: A key with that name already exists."
    exit 1
fi

# Generate the RSA key pair
ssh-keygen -t rsa -b 4096 -f "$key_path" -N "$key_passphrase"

echo "RSA key pair successfully generated!"
