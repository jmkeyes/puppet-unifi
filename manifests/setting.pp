# == Define: unifi::setting

define unifi::setting (
  $ensure = 'present',
  $value  = undef,
) {
  $target = "${::unifi::data_directory}/system.properties"

  $operation = $ensure ? {
    present => 'set',
    absent  => 'rm',
  }

  augeas { "${target}/${name}/${value}":
    changes => "${operation} ${name} ${value}",
    lens    => 'Properties.lns',
    incl    => $target,
  }
}
