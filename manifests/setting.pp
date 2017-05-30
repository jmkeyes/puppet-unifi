# == Define: unifi::setting

define unifi::setting (
  $ensure = 'present',
  $value  = undef,
) {
  $target = "${::unifi::data_path}/system.properties"

  $operation = $ensure ? {
    present => 'set',
    absent  => 'rm',
  }

  augeas { "${target}/${name}/${value}":
    require => Package[$::unifi::package_name],
    changes => "${operation} ${name} ${value}",
    lens    => 'Properties.lns',
    incl    => $target,
  }
}
