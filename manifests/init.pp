# modules/mlocate/manifests/init.pp - manage mlocate stuff
# Copyright (C) 2008 admin@immerda.ch
# GPLv3

class mlocate {
  package{'mlocate':
    ensure => present,
  }

  file{'/etc/updatedb.conf':
    source => ["puppet://$server/modules/site-mlocate/updatedb/${fqdn}/updatedb.conf",
               "puppet://$server/modules/site-mlocate/updatedb/updatedb.conf",
               "puppet://$server/modules/mlocate/updatedb/updatedb.conf" ],
    require => Package['mlocate'],
    owner => root, group => 0, mode => 0644;
  }
}
