puppet-desktoppicture
===================

Puppet module to manage the desktop picture on Mac OS X. This module has been tested to work on 10.7 - 10.10. This module handles the placement scripts onto the client machine. To handle running the script that changes the desktop picture we will use the ``puppet-outset`` module. 

##Dependencies
This module has a dependency on the following:

```bash
mod 'outset',
    :git => 'https://github.com/clburlison/puppet-outset'

mod 'puppetlabs/stdlib', '4.3.2'		
``` 


#Thanks
- [Greg Neagle](http://github.com/gregneagle)
- [Graham Gilbert](http://github.com/grahamgilbert)

#To Do
- validate data for ensure variables.