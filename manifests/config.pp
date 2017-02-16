# == Class: unifi::config

class unifi::config {
  # Import and manage the SSL certificate and private key if supplied.
  if $::unifi::ssl_certificate != undef and $::unifi::ssl_private_key != undef {
    $keystore = "${::unifi::data_path}/keystore"

    java_ks { "unifi:${keystore}":
      ensure      => 'latest',
      certificate => $::unifi::ssl_certificate,
      private_key => $::unifi::ssl_private_key,
      password    => 'aircontrolenterprise',
    }
  }

  # Known configuration parameters:
  # autobackup.dir="${::unifi::data_path}/backup/autobackup" (automatic configuration backups)
  # unifi.http.port=8080 (port for UAP to inform controller)
  # unifi.https.port=8443 (port for controller GUI / API, as seen in web browser)
  # portal.http.port=8880 (port for HTTP portal redirect)
  # portal.https.port=8843 (port for HTTPS portal redirect)
  # unifi.db.port=27117 (local-bound port for DB server)
  # unifi.stun.port=3478 # UDP port used for STUN
}
