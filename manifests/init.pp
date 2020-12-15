# manage mlocate stuff
# Copyright (C) 2008 admin@immerda.ch
# GPLv3
class mlocate {
  package { 'mlocate':
    ensure => present,
  } -> file { '/etc/updatedb.conf':
    source => ["puppet:///modules/site_mlocate/updatedb/${facts['networking']['fqdn']}/updatedb.conf",
                "puppet:///modules/site_mlocate/updatedb/${facts['os']['name']}/updatedb.conf.${facts['os']['release']['major']}",
                "puppet:///modules/site_mlocate/updatedb/${facts['os']['name']}/updatedb.conf",
                'puppet:///modules/site_mlocate/updatedb/updatedb.conf',
                "puppet:///modules/mlocate/updatedb/${facts['os']['name']}/updatedb.conf.${facts['os']['release']['major']}",
                "puppet:///modules/mlocate/updatedb/${facts['os']['name']}/updatedb.conf",
                'puppet:///modules/mlocate/updatedb/updatedb.conf'],
    owner  => root,
    group  => 0,
    mode   => '0644';
  }

  if $facts['os']['family'] == 'RedHat' and versioncmp($facts['os']['release']['major'],8) >= 0 {
    service { 'mlocate-updatedb.timer':
      ensure  => running,
      enable  => true,
      require => File['/etc/updatedb.conf'],
    }
  }
}
