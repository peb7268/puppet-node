#http://docs.puppetlabs.com/references/latest/type.html#exec
#rm -rf .vagrant/ www/ logs/ && mkdir www logs
#This is the default puppet file. It gits ran first and start the provisioning sequence.
#Add your creds to the git pull if using the intengo module

# Enable XDebug ("0" | "1")
$use_xdebug = "0"

#Default paths where puppet looks for binaries
Exec {
  path => ["/usr/bin", "/bin", "/usr/sbin", "/sbin", "/usr/local/bin", "/usr/local/sbin", "/usr/local/rvm/bin/rvm"]
}

exec { 'apt-get update':
        command => '/usr/bin/apt-get update',
        require => Exec['add php55 apt-repo']
}

#Define the stages and order them
stage { 'postmain': }
Stage['main'] -> Stage['postmain']

include bootstrap   	#Sets the fullyqualified domain name and some basics
include other       	#curl and sqlite
include stdlib          #nodejs dep
include apt             #nodejs dep

include rvm
include php
include php55
include mysql
include phpmyadmin
include apache      	#All the apache settings ( ensures php and php-cli are installed before hand )

include nodejs          #install nodejs, npm
include js              #install all the necessary node modules and such
include shell 			#Sets some enviromental defaults ( Aliases and such )
