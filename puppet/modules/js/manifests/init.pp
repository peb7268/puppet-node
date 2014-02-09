#http://ariejan.net/2011/10/24/installing-node-js-and-npm-on-ubuntu-debian/
#https://github.com/joyent/node/wiki/Installing-Node.js-via-package-manager

class js {
    #Install Global w package
	package { 'grunt-cli':
      ensure   => present,
      provider => 'npm',
      require  => [Package[nodejs], Anchor['nodejs::repo']]
    }

    package { 'testem':
      ensure   => present,
      provider => 'npm',
      require  => [Package[nodejs], Anchor['nodejs::repo']]
    }

    package { 'bower':
          ensure   => present,
          provider => 'npm',
          require  => [Package[nodejs], Anchor['nodejs::repo']]
    }

    #Install local with nodejs::npm
    #nodejs::npm { '/opt/razor:express':
    #  ensure  => present,
    #  version => '2.5.9',
    #}
}