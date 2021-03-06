# Class: sonarqube::service
#
# This module manages sonarqube service
#
# Parameters: none
#
# Actions:
#
# Requires: see Modulefile
#
# Sample Usage:
#
class sonarqube::service {
  service { 'sonar':
    ensure => running,
    enable => true,
    path   => '/etc/init.d',
  }
}
