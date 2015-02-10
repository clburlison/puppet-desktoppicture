# == Class: desktoppicture::wallpaper
#
# This class sets the destkop wallpaper script. This script is responsible for
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
# Copyright 2015 Clayton Burlison, unless otherwise noted.
class desktoppicture::wallpaper inherits desktoppicture::params{
  require desktoppicture::setup

  if $ensure_wallpaper != 'present' and $ensure_wallpaper !='absent'{
      fail('Invalid value for ensure')
  }
  
  if $ensure_wallpaper == 'present'{
      file {"${wallpaper_path}/${priority}-${wallpaper_name}":
          owner  => root,
          group  => wheel,
          mode   => '0755',
          content => template('desktoppicture/wallpaper.erb')
      }
  }

  if $ensure_wallpaper == 'absent' {
      file {"${wallpaper_path}/${priority}-${wallpaper_name}":
          ensure => absent,
      }
  }
}