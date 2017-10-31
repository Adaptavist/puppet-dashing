# == Class: dashing::service
#
# This class enforces running of the dashing service.
#
# === Parameters: None
#
# === Examples
#
#  class { 'dashing::service': }
#
class dashing::service {

  # only run the central service if this is a debian system, rhel/cengtos has one per instance
  if ($::osfamily == 'debian') {
    service { $dashing::service_name:
      ensure  => running,
      enable  => true,
    }

    Class['dashing::config'] -> Service[$dashing::service_name]
  }

}
