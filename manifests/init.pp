# modules/mlocate/manifests/init.pp - manage mlocate stuff
# Copyright (C) 2008 admin@immerda.ch
# GPLv3

class mlocate {
    package{'mlocate':
        ensure => present,
    }
}
