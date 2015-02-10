# == Class: desktoppicture::init
#
# This class allows the usage of this module with the superclass name.
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
class desktoppicture{
  include desktoppicture::setup
  include desktoppicture::desktops
  include desktoppicture::wallpaper
}