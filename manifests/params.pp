# Class: sonarqube::params
#
# This module manages sonarqube parameters
#
# Parameters:
#
# None.
#
# Actions:
#
# Requires: see Modulefile
#
# Sample Usage:
#
class sonarqube::params () {
  case $::operatingsystem {
    'Ubuntu' : {
      case $::operatingsystemrelease {
        '12.04', '14.04', '16.04' : {
          case $::architecture {
            'amd64' : {
              $download_base_url = 'https://sonarsource.bintray.com/Distribution/sonarqube'
              $sonar_version = 'sonarqube-6.3'
            }
            default : {
              fail("The ${module_name} module is not supported on ${::operatingsystem} release ${::operatingsystemrelease} ${::architecture}"
              )
            }
          }
        }
        default : {
          fail("The ${module_name} module is not supported on ${::operatingsystem} release ${::operatingsystemrelease}"
          )
        }
      }
    }
    default  : {
      fail("The ${module_name} module is not supported on an ${::operatingsystem} distribution."
      )
    }
  }
}
