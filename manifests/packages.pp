# == Class: nginx::packages
#
# Base nginx install class
#
# === Parameters
#
# Document parameters here.
#
# [*ntp_servers*]
#   Explanation of what this parameter affects and what it defaults to.
#   e.g. "Specify one or more upstream ntp servers as an array."
#
# === Variables
#
# Here you should define a list of variables that this module would require.
#
# [*enc_ntp_servers*]
#   Explanation of how this variable affects the funtion of this class and if it
#   has a default. e.g. "The parameter enc_ntp_servers must be set by the
#   External Node Classifier as a comma separated list of hostnames." (Note,
#   global variables should not be used in preference to class parameters  as of
#   Puppet 2.6.)
#
# === Examples
#
#  include nginx
#
# === Authors
#
# Wagner Souza <wagnersza@gmail.com>
#
# === Copyright
#
# Copyright 2012 Wagner Souza.
#
class nginx::packages {

  $nginx_package_name               =  
  $nginx_package_version            =
  $nginx_passenger_package_name     =
  $nginx_passenger_package_version  =
  $gunicorn_package_name            =
  $gunicorn_package_version         =
  #instala aqui os pacotes
}