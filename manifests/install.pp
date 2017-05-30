# == Class: unifi::install

class unifi::install {
  if $::unifi::manage_repository {
    apt::key { 'unifi':
      id     => $::unifi::repo_key_id,
      server => $::unifi::repo_key_server,
    }

    apt::source { 'unifi':
      comment  => 'Ubiquiti UniFi Controller APT Repository',
      location => $::unifi::repo_location,
      release  => $::unifi::repo_release,
      require  => Apt::Key['unifi'],
      repos    => 'ubiquiti',
      pin      => '200',
      include  => {
        src => false,
        deb => true,
      },
    }

    Apt::Source['unifi'] -> Package[$::unifi::package_name]
  }

  if $::unifi::manage_package {
    package { $::unifi::package_name:
      ensure => $::unifi::package_ensure,
    }
  }
}
