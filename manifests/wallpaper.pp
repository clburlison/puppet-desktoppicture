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
# Copyright 2015 Clayton Burlison, unless otherwise noted.
class desktoppicture::wallpaper inherits desktoppicture::params {
  
  $outset_path = '/usr/local/outset/login-'
	$remove_once_script = 'puppet:///modules/desktoppicture/remove_once.sh'
  
  if $ensure_wallpaper == 'present'{
      file {"${outset_path}${freq}/${priority}-${wallpaper_name}.sh":
          owner   => root,
          group   => wheel,
          mode    => '0755',
          content => template('desktoppicture/wallpaper.erb')
      }
  }

	if $ensure_wallpaper == 'absent' {
	    file {"${outset_path}${freq}/${priority}-${wallpaper_name}.sh":
					ensure => absent,
	 		}
	}
	
	# if $ensure_wallpaper == 'true' {
	# 	file { "$wallpaper" :
	# 	  audit => content,
	# 	}
	#
	# 	exec { "remove_once":
	# 		 command 				=> "${remove_once_script} ${wallpaper_name}",
	# 		 path      => "/usr/local/bin/:/bin/",
	# 	   refreshonly    => true,
	# 	   subscribe      => File["$wallpaper"],
	# 	}
	# }
}
