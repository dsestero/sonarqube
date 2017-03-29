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
class sonarqube ($sonar_version = $sonarqube::params::sonar_version) inherits sonarqube::params {
  class { 'sonarqube::install':
    download_base_url => $sonarqube::params::download_base_url,
    sonar_version     => $sonar_version,
  } -> class { 'sonarqube::config':
  } ~> class { 'sonarqube::service':
  }
}
