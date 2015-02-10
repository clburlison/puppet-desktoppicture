# == Class: desktoppicture::params
#
# This class holds the default paramaters for the desktoppicture module.
#
# == Parameters
#
# [*$wallpaper*] 
#  The absoute path to the desktop picture. Can use puppet:///...
#  Default: '' 
#  Type: String
#
# [*$wallpaper_name*] 
#  The filename of the script that you would like to sit on the filesystem.
#    Note: outset requires the filename to end an extension .sh, .bash, etc.
#  Default: '' 
#  Type: String
#
# [*$wallpaper_path*] 
#  The absoute path to the location on the filesystem you would like to
#    place the wallpaper script (AKA $wallpaper_name).
#  Default: '' 
#  Type: String
#
# [*$script_path*] 
#  The absoute path to the set_desktops.py script. This is the script that
#    interacts with the SQLite database to change the desktop picture. 
#  Default: '' 
#  Type: String
#
# [*$priority*] 
#  Modifies the script name to allow some scripts to run earlier than others.
#    This settings directly ties outset. Lower number = ealier in the runtime. 
#  Default: 10 
#  Type: Integer
#
# [*$ensure_wallpaper*] 
#  This value can be used to remove the background picture from the filesystem.
#  Default: present 
#  Type: Boolean (present/absent)
#
# [*$ensure_desktop*] 
#  This value can be used to remove the set_desktops.py script from the filesystem.
#  Default: present 
#  Type: Boolean (present/absent)
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
class desktoppicture::params {
  $wallpaper         = hiera('desktoppicture::wallpaper', '/Library/Desktop Pictures/Moon.jpg')
  $wallpaper_name    = hiera('desktoppicture::wallpaper_name', 'wallpaper.sh')
  $wallpaper_path    = hiera('desktoppicture::wallpaper_path', '/usr/local/outset/login-once')
  $script_path       = hiera('desktoppicture::script_path', '/usr/local/bin/set_desktops.py')
  $priority          = hiera('desktoppicture::priority', '10')
  $ensure_wallpaper  = hiera('desktoppicture::ensure_wallpaper', 'present')
  $ensure_desktop    = hiera('desktoppicture::ensure_desktop', 'present')
  
  validate_absolute_path ($wallpaper)
  validate_string ($wallpaper_name)
  validate_absolute_path ($wallpaper_path)
  validate_absolute_path ($script_path)

  unless is_integer($priority) {
    fail("Not an integer")
  }
  
  # TO DO : Need to validate the ensure vars somehow.

}
