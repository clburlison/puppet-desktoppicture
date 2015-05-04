puppet-desktoppicture
===================

Puppet module to manage the desktop picture on Mac OS X. This module has been tested to work on 10.7 - 10.10. 

This module will:
* place the ``set_desktops.py`` script, which handles writing data to the SQLite database file. 
* create a user readable launch script that outset can run at login-every or login-once.

This module has cleanup parameters to easily remove all files placed on the filesystem in the future.

I highly recommend using Hiera in conjunction with this module.

##Dependencies
This module has a dependency on the following:

```bash
mod 'outset',
    :git => 'https://github.com/clburlison/puppet-outset'

mod 'puppetlabs/stdlib', '4.3.2'		
``` 

#Thanks
- [Greg Neagle](http://github.com/gregneagle) - ``set_desktops.py``
- [Joseph Chilcote](https://github.com/chilcote/) - his awesome [outset project](https://github.com/chilcote/outset)

#To Do
- **wallpaper.pp** - Use a statement to check for existent of script then notify the removal via the Exec["remove_old_scripts"]. This will make puppet run one time if asked to remove the files.
	- Summary of Issue: Currently the removal of the wallpaper script is very non-puppet like. If ``desktoppicutre::ensure_wallpaper: 'absent'`` is set the class will try to remove the files on every puppet run. Since you can change the location and name of the script that sets the wallpaper in so many ways this was the only way I could think that removes all possible cases. 
	- Or maybe check for current $version and remove old versions if they exist that should be do-able?
- Create an exec method that will remove old <date> key from ~/L/Pref/com.github.outset.once.plist if picture is modified
	- This function will replace the need for versions in this module. 
	- Once this function is working this will replace the need for the former removing old scripts.
	- Will need to pass a list of all current users on the filesystem
  - Use Graham's [python script](https://github.com/grahamgilbert/macscripts/blob/master/scriptRunnerToOutset/01-scriptRunnerToOutset_user_plist.py).
	- Will need to create an additional parameter to enable admin to ensure the refresh or disable feature. ``$ensure_current``?
	- Use defaults to remove key from pref-file
	  - ``defaults delete ~/Library/Preferences/com.github.outset.once /usr/local/outset/login-once/wallpaper.sh``
- Think about renaming the module to ``puppet-desktop``
