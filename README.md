# 0x0B-ssh: Zero-Trust SSH Onboarding

Sets up your computer so you can log in to SecurePay's staging server securely using a key file instead of a password. Puppet then keeps the setup in place automatically.

## Please note

Only the public key (`school.pub`) is ever shared. The private key (`~/.ssh/school`) must never be sent, printed or committed to git.

## Files

| File                       | Purpose                                                                                |
| -------------------------- | -------------------------------------------------------------------------------------- |
| `0-create_ssh_key_pair.sh` | Creates a 4096-bit RSA key pair named `school` in `~/.ssh/`, protected by a passphrase |
| `1-submit_public_key.sh`   | Prints the public key to send to the administrator, with a security reminder           |
| `2-use_a_private_key.sh`   | Connects to the server using the `school` private key                                  |
| `3-ssh_config.sh`          | Writes `~/.ssh/config` to use the `school` key and refuse password authentication      |
| `100-puppet_ssh_config.pp` | Puppet manifest that enforces the same SSH client config                               |

## Usage

Run the scripts in order from this directory:

```bash
chmod +x *.sh
./0-create_ssh_key_pair.sh     # generate the key pair
./1-submit_public_key.sh       # copy the output and send it to the administrator
./2-use_a_private_key.sh       # connect once the key is registered
./3-ssh_config.sh              # configure the SSH client
puppet apply 100-puppet_ssh_config.pp   # enforce the config with Puppet
```

After Task 3, `ssh school` connects with no extra flags.

## Verification

```bash
ls -l ~/.ssh/school ~/.ssh/school.pub
ssh-keygen -l -f ~/.ssh/school.pub    # should report a 4096-bit RSA key
ssh -v <username>@<server-ip>         # should show the school identity file in use
```

## Requirements

- Linux or macOS with OpenSSH
- Puppet, for the manifest
- An account on the staging server
