# modules/mlocate/manifests/init.pp - manage mlocate stuff
# Copyright (C) 2008 admin@immerda.ch
# GPLv3

class mlocate {
  package{'mlocate':
    ensure => present,
  }

  file{'/etc/updatedb.conf':
    source => ["puppet:///modules/site_mlocate/updatedb/${::fqdn}/updatedb.conf",
               "puppet:///modules/site_mlocate/updatedb/${::operatingsystem}/updatedb.conf",
               "puppet:///modules/site_mlocate/updatedb/updatedb.conf",
               "puppet:///modules/mlocate/updatedb/${::operatingsystem}/updatedb.conf.${::lsbdistcodename}",
               "puppet:///modules/mlocate/updatedb/${::operatingsystem}/updatedb.conf",
               "puppet:///modules/mlocate/updatedb/updatedb.conf" ],
    require => Package['mlocate'],
    owner => root, group => 0, mode => 0644;
  }
}
