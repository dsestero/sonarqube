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
class sonarqube::install ($download_base_url, $sonar_version) {
  include java::java_8

$distribution_name = "${sonar_version}.zip"

class {'postgresql::server':
  encoding => 'UTF-8',
  locale   => 'en_US.UTF-8',
}

  postgresql::server::db { 'sonarqube':
    user     => 'sonarqube',
    password => 'sonarqube',
  } ->
  download_uncompress { 'install_sonarqube':
    download_base_url => $download_base_url,
    distribution_name => $distribution_name,
    dest_folder       => "/opt",
    creates           => "/opt/${sonar_version}",
    uncompress        => 'zip',
  } ->
  file {'/opt/sonar':
    ensure => link,
    target => "/opt/${sonar_version}",
  } ~>
  exec {'set_perms_sonar':
    command     =>  "/bin/chown -R sonar:adm /opt/${sonar_version}",
    refreshonly =>  true
  }

}
