# Class: sonarqube::config
#
# This module manages sonarqube config
#
# Parameters: none
#
# Actions:
#
# Requires: see Modulefile
#
# Sample Usage:
#
class sonarqube::config () {
  file { '/var/log/sonar':
    ensure => directory,
    owner  => 'sonar',
    group  => 'adm',
  }

  file { "/opt/sonar/logs":
    ensure => link,
    target => "/var/log/sonar",
    force  => true,
  }

  file_line { 'jdbc.username':
    ensure => present,
    path   => '/opt/sonar/conf/sonar.properties',
    line   => 'sonar.jdbc.username=sonarqube',
    match  => '^sonar.jdbc.username=',
  }

  file_line { 'jdbc.password':
    ensure => present,
    path   => '/opt/sonar/conf/sonar.properties',
    line   => 'sonar.jdbc.password=sonarqube',
    match  => '^sonar.jdbc.password=',
  }

  file_line { 'jdbc.url':
    ensure => present,
    path   => '/opt/sonar/conf/sonar.properties',
    line   => 'sonar.jdbc.url=jdbc:mysql://localhost:3306/sonarqube?useUnicode=true&characterEncoding=utf8&rewriteBatchedStatements=true&useConfigs=maxPerformance',
    match  => '^sonar.jdbc.url=',
  }

  file_line { 'jdbc.driverClassName':
    ensure => present,
    path   => '/opt/sonar/conf/sonar.properties',
    line   => 'sonar.jdbc.driverClassName=com.mysql.jdbc.Driver',
    match  => '^sonar.jdbc.driverClassName=',
  }

}
