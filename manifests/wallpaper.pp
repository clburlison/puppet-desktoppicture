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
class desktoppicture::wallpaper inherits desktoppicture::params {
  
  $outset_path = '/usr/local/outset/login-'
  
  if $ensure_wallpaper == 'present'{
      file {"${outset_path}${freq}/${priority}-${wallpaper_name}-${version}.sh":
          owner   => root,
          group   => wheel,
          mode    => '0755',
          content => template('desktoppicture/wallpaper.erb')
      }
  }

 if $ensure_wallpaper == 'absent' {
   exec { "remove_old_scripts":
       command   => "rm ${outset_path}*/*-${wallpaper_name}-*.sh 2>/dev/null",
       path      => "/usr/local/bin/:/bin/",
       logoutput => false,
   }
 }
}
