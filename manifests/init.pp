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
class sonarqube ($distribution_name = $sonarqube::params::distribution_name) inherits sonarqube::params {
  class { 'sonarqube::install':
    download_base_url => $sonarqube::params::download_base_url,
    distribution_name => $distribution_name,
  } -> class { 'sonarqube::config':
  } ~> class { 'sonarqube::service':
  }
}
