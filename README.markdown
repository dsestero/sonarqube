#sonarqube

####Table of Contents

1. [Overview](#overview)
2. [Module Description - What the module does and why it is useful](#module-description)
3. [Setup - The basics of getting started with sonarqube](#setup)
    * [What sonarqube affects](#what-sonarqube-affects)
    * [Setup requirements](#setup-requirements)
    * [Beginning with sonarqube](#beginning-with-sonarqube)
4. [Usage - Configuration options and additional functionality](#usage)
5. [Reference - An under-the-hood peek at what the module is doing and how](#reference)
5. [Limitations - OS compatibility, etc.](#limitations)
6. [Development - Guide for contributing to the module](#development)

##Overview

This is the sonarqube module. It deliver SonarQube (previously known as Sonar), the Open Source platform to manage code quality (see http://www.sonarqube.org/).

##Module Description

The module creates a local `sonarqube` mysql db, adds the SonarQube Debian/Ubuntu repository, installs the software, configures logs and db parameters, and enable the service to start at boot.

##Setup

###What sonarqube affects

* installs packages `openjdk-7-jdk`, `mysql-server` and `mysql-client` if not yet installed

* creates a new `sonarqube` db (access with `sonarqube`/`sonarqube`) to be used by the SonarQube software to record the quality metrics

* adds to the system the Debian/Ubuntu repository for SonarQube distribution (creates a file `sonarqube.list` in `/etc/apt/sources.list.d`)

* installs the package `sonar` from the newly configured repo

* creates `/var/log/sonar` directory owned by `sonar:adm`

* link `/opt/sonar/logs` to the log directory created under `/var`

* configures the software by providing username, password, url and driver class name to access the db

* enable a new service sonar to start at boot and listen for http request on port 9000.

###Setup Requirements **OPTIONAL**

This modules requires the following other modules to be installed:

* `dsestero/java`
    to install a suitable java development environment

* `puppetlabs/mysql`
    to install mysql db

* `puppetlabs/apt`
    in order to add the SonarQube repository

* `puppetlabs/stdlib`
    to have additional resource type like `file_line`, useful for configuring the software
	
###Beginning with sonarqube	

To install sonarqube as a service with default configuration, it is possible to use a declaration as the following:

```
include sonarqube
```

##Usage

At the moment there are no customizations. 

##Reference

###Public Classes

* [`sonarqube::sonarqube`](#sonarqubesonarqube): Manages sonarqube

###Private Classes

* [`sonarqube::params`](#sonarqubeparams): Specifies the module defaults
* [`sonarqube::install`](#sonarqubeinstall): Installs the module artifacts
* [`sonarqube::config`](#sonarqubeconfig): Configures the module artifacts
* [`sonarqube::service`](#sonarqubeservice): Sets up the service

###`sonarqube::sonarqube`
Installs, configure and sets up a sonarqube service.

##Limitations

At the moment the module targets only OpenJDK on Ubuntu platforms. Specifically, it is tested only on Ubuntu 12.04 64 bit distributions, although probably it will work also on more recent versions and different architectures.

##Development

If you need some feature please send me a (pull) request or send me an email at: dsestero 'at' gmail 'dot' com.
