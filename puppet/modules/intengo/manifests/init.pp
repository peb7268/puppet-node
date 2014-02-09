#Dont fortget to put your git creds in the git pull
class intengo {

	exec { "Grab the intengo repo":
		command => "git clone https://github.com/Infosurv/icev2.git /vagrant/www",
		require => [Exec['clean www directory'], Package['php5'], Package['git-core']],
		timeout => 900
	}

	# exec { "update packages":
	#        command => "/bin/sh -c 'cd /var/www/ && composer --verbose --prefer-dist update'",
	#        require => [Package['git-core'], Package['php5'], Exec['global composer']],
	#        onlyif => [ "test -f /var/www/composer.json", "test -d /var/www/vendor" ],
	#        timeout => 900
	# }

	exec { "install packages":
		cwd		=> "/var/www",
        command => "/bin/sh -c 'cd /var/www && sudo COMPOSER_PROCESS_TIMEOUT=4000 composer install'",
        require => [Package['git-core'], Exec['Grab the intengo repo']],
        #onlyif 	=> [ "test -f /var/www/composer.json" ],
        creates => "/var/www/vendor/autoload.php",
        timeout => 0
	}

	exec { "migrate and seed":
		cwd		=> "/var/www",
		command => "bash -c 'sudo php artisan migrate --seed'",
		require => [Exec['Grab the intengo repo'], Exec['install packages']],
		timeout => 900,
		logoutput => true
	}

	file { '/var/www/app/storage':
		mode => 0777
	}
}
