# A puppet manifest  to automate the task of creating
# a custom HTTP header response.

class nginx_custom_header {
    package { 'nginx':
        ensure => installed,
    }

    $hostname = $::hostname

    file { '/etc/nginx/sites-available/default':
        ensure => file,
        content => "
            server {
                listen 80
                listen [::]:80
                server_name _;
                root /var/www/html;
                index index.html;
                location / { 
                     return 200 \"Hello World!\n\";
                }
                add_header X-Served-By $hostname;
       	}
    ",
    require => Package['nginx'],
    notify => Service['nginx'],
    }

    service { 'nginx':
	ensure    => running,
	enable    => true,
	subscribe => File['/etc/nginx/sites-available/default'],
    }
}

include nginx_custom_header
