# A manifest to set up your client SSH configuration file
# so that you can connect to a server without typing a password

# Configure SSH to use specified private key
file { '/home/ubuntu/.ssh/config':
  ensure  => file,
  content => "IdentifyFile ~/.ssh/school\n",
  mode    => '0600',
  owner   => 'ubuntu',
}


# Configure SSH client to refuse to authenticate using a password
file_line { 'PasswordAuthentication':
  path  => '/etc/ssh/sshd_config',
  line  => 'PasswordAuthentication no'
  match => '^#?PasswordAuthentication\s+.*',
}

#Restart SSH service to apply changes
service { 'ssh':
  ensure    => 'running',
  enable    => 'true'
  subscribe => File['/home/ubuntu/.ssh/config', '/etc/ssh/sshd_config'],
}
