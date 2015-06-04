# == Class: dashing::install
#
# This class makes sure that the required packages are installed.
#
# === Parameters: None
#
# === Examples
#
#  class { 'dashing::install': }
#
class dashing::install {

  file {$dashing::dashing_basepath:
    ensure => directory,
    owner  => $dashing::run_user,
    group  => $dashing::run_group,
    mode   => 0644,
  }

  package {$dashing::dashing_package_name:
    ensure   => $dashing::package_status,
    provider => 'gem',
  }

  if !defined(Package['nodejs']) {
    package {'nodejs':
      ensure => installed,
    }
  }

}
