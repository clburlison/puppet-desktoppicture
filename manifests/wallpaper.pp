# == Class: desktoppicture::wallpaper
#
# This class sets the desktop wallpaper script. This script is responsible for
#   setting the defined wallpaper. 
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
class desktoppicture::wallpaper inherits desktoppicture::params {

  if $ensure_wallpaper == 'present'{
    outset::login_"${freq}"{"${wallpaper_name}":
        ensure   => present,
        script   => template('desktoppicture/wallpaper.erb'),
        priority => ${priority},
    }
  }
  else {
    outset::login_"${freq}"{"${wallpaper_name}":
        ensure => absent,
        priority => ${priority}
    }
  }
}
