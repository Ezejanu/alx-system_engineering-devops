# A script to change the OS configuration so that it is possible to login with the holberton user and open a file without any error message.

# Increasing hard limit
exec { 'increase_hard_limit':
  command => "sed -i '/^holberton hard/s/10/30000/' /etc/security/limits.conf",
  path    => '/usr/local/bin/:/bin/'
  }

# Increasing soft limit
exec { 'increase_soft_limit':
  command => "sed -i '/^holberton soft/s/5/30000/' /etc/security/limits.conf",
  path    => '/usr/local/bin/:/bin/'
}
