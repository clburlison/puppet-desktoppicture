# == Class: desktoppicture::params
#
# This class holds the default parameters for the desktoppicture module.
#
# == Parameters
#
# [*$wallpaper*] 
#  The absoute path to the desktop picture.
#  Default: '/Library/Desktop Pictures/Moon.jpg' 
#  Type: String
#
# [*$wallpaper_name*] 
#  The filename of the script that you would like to sit on the filesystem.
#    Note: the file extension of .sh is added automatically.
#  Default: 'wallpaper' 
#  Type: String
#
# [*$script_path*] 
#  The absolute path to the set_desktops.py script. This is the script that
#    interacts with the SQLite database to change the desktop picture. 
#  Default: '/usr/local/bin/set_desktops.py' 
#  Type: String
#
# [*$freq*] 
#  This is the frequency that you wish the desktop picture to be changed. 
#  Default: 'once' 
#  Type: String (once OR every)
#
# [*$priority*] 
#  Modifies the script name to allow earlier or later runs used in conjunction
#    with outset. Lower number = earlier in the run. 
#  Default: 10 
#  Type: Integer
#
# [*$ensure_wallpaper*] 
#  This value can be used to remove the background picture from the filesystem.
#    Note: currently this setting this variable  to absent will not delete 
#    files that have a different version, priority, or freq than defined.
#  Default: present 
#  Type: Boolean (present OR absent)
#
# [*$ensure_desktop*] 
#  This value can be used to remove the set_desktops.py script from the filesystem.
#  Default: present 
#  Type: Boolean (present OR absent)
#
# [*ensure_current*]
#   Ensures that the latest wallpaper is used. If using the same wallpaper name
#     an update to the file will result in a refresh on client machines.
#     *** NOT CURRENTLY WORKING ***
#   Default: true
#   Type: Bool
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
class desktoppicture::params (
  $wallpaper         = hiera('desktoppicture::wallpaper', '')
  $wallpaper_name    = hiera('desktoppicture::wallpaper_name', 'wallpaper')
  $script_path       = hiera('desktoppicture::script_path', '/usr/local/bin/set_desktops.py')
  $freq              = hiera('desktoppicture::freq', 'once')
  $priority          = hiera('desktoppicture::priority', '10')
  $ensure_wallpaper  = hiera('desktoppicture::ensure_wallpaper', 'present')
  $ensure_desktop    = hiera('desktoppicture::ensure_desktop', 'present')
  $ensure_current    = hiera('destkoppicture::ensure_current', true)
){
  
  validate_absolute_path ($wallpaper)
  validate_string ($wallpaper_name)
  validate_absolute_path ($script_path)
  
  if $freq != 'once' and $freq !='every'{
      fail('Invalid value for freq.')
  }

  unless is_integer($priority) {
    fail('Invalid value for priority. Not an integer.')
  }
  
  if $ensure_desktop != 'present' and $ensure_desktop !='absent'{
      fail('Invalid value for ensure_desktop.')
  }

  if $ensure_wallpaper != 'present' and $ensure_wallpaper !='absent'{
      fail('Invalid value for ensure_wallpaper.')
  }
  
  validate_bool ($ensure_current)
}
