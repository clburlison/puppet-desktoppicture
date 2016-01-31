# == Class: desktoppicture::desktops
#
# This class sets the set_desktops.py script in the desired
#   location on the filesystem.
#
# == Parameters
#
# See params.pp for full list of parameters.
#
# === Examples
#
# See setup.pp for full list of examples.
#
# === Authors
#
# Clayton Burlison <clburlison@gmail.com>
#
# === Copyright
#
# Copyright 2016 Clayton Burlison, unless otherwise noted.
class desktoppicture::desktops inherits desktoppicture::params {

  if $ensure_desktop == 'present'{
      file {$script_path:
          source => 'puppet:///modules/desktoppicture/set_desktops.py',
          owner  => root,
          group  => wheel,
          mode   => '0755',
      }
  }

  if $ensure_desktop == 'absent' {
      file {$script_path:
          ensure => absent,
      }
  }
}
