# == Class: unifi

class unifi (
  $manage_package    = true,
  $package_name      = 'unifi',
  $package_ensure    = 'installed',
  $manage_service    = true,
  $service_name      = 'unifi',
  $service_ensure    = 'running',
  $service_enable    = true,
  $manage_repository = true,
  $repo_key_id       = '4A228B2D358A5094178285BE06E85760C0A52C50',
  $repo_key_server   = 'keyserver.ubuntu.com',
  $repo_location     = 'http://www.ubnt.com/downloads/unifi/debian',
  $repo_release      = 'stable',
  $ssl_certificate   = undef,
  $ssl_private_key   = undef,
  $log_path          = '/var/log/unifi',
  $run_path          = '/var/run/unifi',
  $data_path         = '/var/lib/unifi',
) {
  # Fail fast if we're not using a new Puppet version.
  if versioncmp($::puppetversion, '3.7.0') < 0 {
    fail('This module requires the use of Puppet v3.7.0 or newer.')
  }

  contain '::unifi::install'
  contain '::unifi::config'
  contain '::unifi::service'

  Class['::unifi::install']
  -> Class['::unifi::config']
  ~> Class['::unifi::service']
}
