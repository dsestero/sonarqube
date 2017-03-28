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
class sonarqube::install ($distribution_name) {
  include java::java_8

class {'postgresql::server':
  encoding => 'UTF-8',
  locale   => 'en_US.UTF-8',
}

  postgresql::server::db { 'sonarqube':
    user     => 'sonarqube',
    password => 'sonarqube',
  } ->
  download_uncompress { 'install_sonarqube':
    distribution_name => $distribution_name,
    dest_folder       => "/opt/sonar",
    creates           => "/opt/sonar",
    uncompress        => 'zip',
    user              => sonar,
    group             => adm,
  }

}
