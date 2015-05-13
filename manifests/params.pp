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
        '12.04' : {
          case $::architecture {
            'amd64' : {
              # set some variables
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
