# Enable XDebug ("0" | "1")
$use_xdebug = "0"

#Default paths where puppet looks for binaries
Exec {
  path => ["/usr/bin", "/bin", "/usr/sbin", "/sbin", "/usr/local/bin", "/usr/local/sbin", "/usr/local/rvm/bin/rvm"]
}

#Define the stages and order them
stage { 'premain': }
stage { 'postmain': }
Stage['premain'] -> Stage['main'] -> Stage['postmain']

class { 'bootstrap':
      stage => premain,
}

class { 'ruby':
    stage => postmain
}

include bootstrap   	#Sets the fullyqualified domain name and some basics
include other       	#curl and sqlite
include stdlib          #nodejs dep
include apt             #nodejs dep

include rvm
include ruby            #Puppet Equivilant of a Gemfile

include php
include php55
include mysql
include phpmyadmin
include apache      	#All the apache settings ( ensures php and php-cli are installed before hand )

include nodejs          #install nodejs, npm
include js              #install all the necessary node modules and such
include shell 			#Sets some enviromental defaults ( Aliases and such )
