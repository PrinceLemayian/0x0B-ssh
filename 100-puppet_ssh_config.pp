# Puppet manifest enforcing SSH client configuration
# Ensures ~/.ssh/config uses the school identity file and disables password authentication

# Detect who is running so that the manifest works for any user
$user = $facts['identity']['user']

# Work out the user's home directory
$home = $user ? {
        'root' => '/root',
        default => "/home/${user}",
    }

# Ensure ~/.ssh exists, is private and belongs to the user.
# Required for the config to have a folder to stay in.
file { "${home}/.ssh":
  ensure  => directory,
  owner   => $user, 
  mode    => '0700',
}

# Enforce compliant ssh client config
file { "${home}/.ssh/config":
  ensure  => file,
  owner   => $user,
  mode    => '0600',   
  content => "Host school 144.217.6.26\n    HostName 144.217.6.26\n    User princer\n    IdentityFile ~/.ssh/school\n    PasswordAuthentication no\n",
  require => File["${home}/.ssh"],
}
