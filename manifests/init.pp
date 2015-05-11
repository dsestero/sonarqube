# Class: sonarqube
#
# This module manages sonarqube
#
# Parameters: none
#
# Actions:
#
# Requires: see Modulefile
#
# Sample Usage:
#
class sonarqube inherits sonarqube::params {
  class { 'sonarqube::install':
  } -> class { 'sonarqube::config':
  } ~> class { 'sonarqube::service':
  }
}
