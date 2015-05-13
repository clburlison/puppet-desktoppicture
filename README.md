puppet-desktoppicture
===================

Puppet module to manage the desktop picture on Mac OS X. This module has been tested to work on 10.7 - 10.10. 

This module will:
* place the ``set_desktops.py`` script, which handles changing the desktop picture for all screens. 
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