# This is a script to fix the stack so there are no failed requests

class nginx_ulimit {

  # Get the hard limit
  $hard_limit = inline_template('<%= `/sbin/sysctl -n kern.ipc.maxfiles` %>')

  # Set the soft limit to the hard limit
  limits { 'nginx_limits':
    domain      => 'nginx',
    type        => 'soft',
    item        => 'nofile',
    value       => 'hard_limit',
    target      => '/etc/security/limits.d/nginx.conf',
    target_type => 'file',
    notify      => Exec['restart_nginx'],
  }

  # Restart nginx
  exec { 'restart_nginx':
    command      => 'service nginx restart',
    refreshonly  => true,
  }
}
