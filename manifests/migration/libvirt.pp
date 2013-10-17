#
class nova::migration::libvirt {

  case $::osfamily {
    'RedHat': {
      file_line { '/etc/libvirt/libvirtd.conf listen_tls':
        path   => '/etc/libvirt/libvirtd.conf',
        line   => 'listen_tls = 0',
        match  => 'listen_tls =',
        notify => Service['libvirt'],
      }

      file_line { '/etc/libvirt/libvirtd.conf listen_tcp':
        path   => '/etc/libvirt/libvirtd.conf',
        line   => 'listen_tcp = 1',
        match  => 'listen_tcp =',
        notify => Service['libvirt'],
      }

      file_line { '/etc/libvirt/libvirtd.conf auth_tcp':
        path   => '/etc/libvirt/libvirtd.conf',
        line   => 'auth_tcp = "none"',
        match  => 'auth_tcp =',
        notify => Service['libvirt'],
      }

      file_line { '/etc/sysconfig/libvirtd libvirtd args':
        path  => '/etc/sysconfig/libvirtd',
        line  => 'LIBVIRTD_ARGS="--listen"',
        match => 'LIBVIRTD_ARGS=',
      }
    }

    'Debian': {
      file_line { '/etc/libvirt/libvirtd.conf listen_tls':
        path   => '/etc/libvirt/libvirtd.conf',
        line   => 'listen_tls = 0',
        match  => 'listen_tls =',
        notify => Service['libvirt'],
      }

      file_line { '/etc/libvirt/libvirtd.conf listen_tcp':
        path   => '/etc/libvirt/libvirtd.conf',
        line   => 'listen_tcp = 1',
        match  => 'listen_tcp =',
        notify => Service['libvirt'],
      }

      file_line { '/etc/libvirt/libvirtd.conf auth_tcp':
        path   => '/etc/libvirt/libvirtd.conf',
        line   => 'auth_tcp = "none"',
        match  => 'auth_tcp =',
        notify => Service['libvirt'],
      }

      file_line { '/etc/default/libvirt-bin libvirtd opts':
        path  => '/etc/default/libvirt-bin',
        line  => 'libvirtd_opts="-d -l"',
        match => 'libvirtd_opts=',
      }

    }

    default:  {
      warning("Unsupported osfamily: ${::osfamily}, make sure you are configuring this yourself")
    }
  }
}
