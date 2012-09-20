class swift::storage::container(
  $package_ensure = 'present'
) {
  swift::storage::generic { 'container':
    package_ensure => $package_ensure
  }

  # Not tested in other distros, safety measure
  if $operatingsystem == 'Ubuntu' {
    service { 'swift-container-updater':
      ensure    => running,
      enable    => true,
      provider  => $::swift::params::service_provider,
    }
    service { 'swift-container-auditor':
      ensure    => running,
      enable    => true,
      provider  => $::swift::params::service_provider,
    }
    # The following service conf is missing in Ubunty 12.04
    file { '/etc/init/swift-container-sync.conf':
      source => 'puppet:///modules/swift/swift-container-sync.conf.upstart',
    }
    service { 'swift-container-sync':
      ensure    => running,
      enable    => true,
      provider  => $::swift::params::service_provider,
      require   => File['/etc/init/swift-container-sync.conf']
    }
  }
}
