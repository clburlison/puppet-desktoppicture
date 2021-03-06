# == Class: desktoppicture::setup
#
# This class creates required directories for the desktoppicture module.
#
# == Parameters
#
# See params.pp for full list of parameters.
#
# === Examples
# This class was designed to be used with Hiera. As such, the best way to pass
# options is to specify them in your Hiera datadir:
#
#  # Example: defaults.yaml
#  ---
# desktoppicture::wallpaper: 
#    '/private/etc/puppet/environments/production/modules/profile/files/wallpaper/bisd_default.jpg'
# desktoppicture::freq: 'every'
# desktoppicture::priority: '8'
# desktoppicutre::ensure_wallpaper: 'absent'
#
# Then simply, create a manifest and include the class...
#
#  # Example: my_manifest.pp
#  include desktoppicture
#
# If you just wish to test the functionality of this class, you could also do
# something along these lines:
#
#  class { 'desktoppicture':
#   wallpaper  => '/Library/Desktop Pictures/Moon.jpg',
#   freq => 'every',
#  }
#
# === Authors
#
# Clayton Burlison <clburlison@gmail.com>
#
# === Copyright
#
# Copyright 2015 Clayton Burlison, unless otherwise noted.
class desktoppicture::setup inherits desktoppicture::params {
    
  if $::osfamily != 'Darwin' {
      fail("Unsupported osfamily: ${::osfamily}")
    }
  
  if ! defined(File['/usr/local']) {
    file { '/usr/local':
      ensure => directory,
    }
  }

  if ! defined(File['/usr/local/outset']) {
    file { '/usr/local/outset':
      ensure => directory,
    }
  }
  
  if ! defined(File['/usr/local/outset/login-every']) {
    file { '/usr/local/outset/login-every':
      ensure => directory,
    }
  }

  if ! defined(File['/usr/local/outset/login-once']) {
    file { '/usr/local/outset/login-once':
      ensure => directory,
    }
  }

  contain desktoppicture::wallpaper
  contain desktoppicture::desktops
    
}