# == Class: unifi::install

class unifi::install {
  if $::unifi::manage_repository {
    apt::key { 'unifi':
      id => $::unifi::repo_key_id,
    }

    apt::source { 'unifi':
      comment  => 'Ubiquiti UniFi Controller APT Repository',
      location => $::unifi::repo_location,
      release  => $::unifi::repo_release,
      repos    => 'ubiquiti',
      pin      => '200',
      include  => {
        src => false,
        deb => true,
      },
    }
  }

  if $::unifi::manage_package {
    package { $::unifi::package_name:
      ensure => $::unifi::package_ensure,
    }
  }
}
