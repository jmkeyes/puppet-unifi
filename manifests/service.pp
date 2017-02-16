# == Class: unifi::service

class unifi::service {
  if $::unifi::manage_service {
    service { $::unifi::service_name:
      ensure => $::unifi::service_ensure,
      enable => $::unifi::service_enable,
    }
  }
}
