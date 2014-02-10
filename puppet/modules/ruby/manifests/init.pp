#Installs Ruby Deps - Basically a puppet version of a Gemfile

class ruby {

    #Install some gems
    rvm_gem { 'sass':
        name => 'sass',
        ruby_version => 'ruby-1.9.3-p484',
        ensure => latest,
        require => Rvm_system_ruby['ruby-1.9.3-p484'];
    }

    rvm_gem { 'rspec':
        name => 'rspec',
        ruby_version => 'ruby-1.9.3-p484',
        ensure => latest,
        require => Rvm_system_ruby['ruby-1.9.3-p484'];
    }

    rvm_gem { 'pry':
        name => 'pry',
        ruby_version => 'ruby-1.9.3-p484',
        ensure => latest,
        require => Rvm_system_ruby['ruby-1.9.3-p484'];
    }

    rvm_gem { 'selenium-webdriver':
        name => 'selenium-webdriver',
        ruby_version => 'ruby-1.9.3-p484',
        ensure => latest,
        require => Rvm_system_ruby['ruby-1.9.3-p484'];
    }

    rvm_gem { 'json':
        name => 'json',
        ruby_version => 'ruby-1.9.3-p484',
        ensure => latest,
        require => Rvm_system_ruby['ruby-1.9.3-p484'];
    }

    rvm_gem { 'capybara':
        name => 'capybara',
        ruby_version => 'ruby-1.9.3-p484',
        ensure => latest,
        require => Rvm_system_ruby['ruby-1.9.3-p484'];
    }

    rvm_gem { 'poltergeist':
        name => 'poltergeist',
        ruby_version => 'ruby-1.9.3-p484',
        ensure => latest,
        require => Rvm_system_ruby['ruby-1.9.3-p484'];
    }
}