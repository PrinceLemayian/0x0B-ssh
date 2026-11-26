#!/usr/bin/env bash
# Configures the SSH client to use the school key and refuse password logins

mkdir -p ~/.ssh
cat >~/.ssh/config <<'EOF'
Host school 144.217.6.26
    HostName 144.217.6.26
    User princer
    IdentityFile ~/.ssh/school
    PasswordAuthentication no
EOF
chmod u=rw,go= ~/.ssh/config
