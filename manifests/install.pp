# Class: sonarqube::install
#
# This module manages sonarqube install
#
# Parameters: none
#
# Actions:
#
# Requires: see Modulefile
#
# Sample Usage:
#
class sonarqube::install () {
  include java::java_8, apt

class {'postgresql::server':
  encoding => 'UTF-8',
  locale   => 'en_US.UTF-8',
}

#  class { 'postgresql::globals':
#  encoding => 'UTF-8',
#  locale   => 'en_US.UTF-8',
#  }->
#  class { 'postgresql::server':
#  }


  postgresql::server::db { 'sonarqube':
    user     => 'sonarqube',
    password => 'sonarqube',
  } ->
  #  file { '/etc/apt/sources.list.d/sonarqube.list':
  #    ensure  => present,
  #    content => 'deb http://downloads.sourceforge.net/project/sonar-pkg/deb
  #    binary/',
  #  } ~>
  #  exec { 'update-repo-sonar':
  #    command     => 'apt-get update -y --allow-unauthenticated -f',
  #    refreshonly => true,

  apt::source { 'sonarqube':
    location       => 'http://downloads.sourceforge.net/project/sonar-pkg/deb',
    repos          => 'binary/',
    release        => '',
    include_src    => false,
    trusted_source => true,
  } ->
  package { 'sonar':
    ensure => present,
  #    install_options => ['--allow-unauthenticated', '-f'],
  }
}
