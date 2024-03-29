# == Class: nginx
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
class nginx {
  # instala o pacote do nginx
  include nginx::packages
  include nginx::params
  
  # coloca a conf padrao
  file { "nginx_conf_file":
    path    => $::nginx::params::nginx_conf_file,
    content => template($::nginx::params::nginx_conf_file_template),
    mode    => "0644",
    require => Class[Nginx::Packages]
  }
  
  # colocar location padrao
  file { "nginx_location_conf_file":
    path    => $::nginx::params::nginx_location_conf_file,
    content => template($::nginx::params::nginx_location_conf_file_template),
    mode    => "0644",
    require => File[nginx_conf_file]
  }
  
  file { "nginx_conf_end":
    path    => $::nginx::params::nginx_conf_end,
    content => template($::nginx::params::nginx_conf_end_template),
    mode    => "0644",
    require => File[nginx_location_conf_file]
  }

  # configura logrotate
  # coloca no sysctl
  # starta/restarta nginx
  # tentar - colocar option para upstream
  
}

# Nginx: httpd puro servindo estático
#     - nginx.conf
#         + include mimetype
#         + include locations
#     
#         + include upstream
#         
# Funciona assim:
#     
#   # nginx puro servindo estatico
# 
#   include nginx       
#     
#   # define de upstream (vai só incluir na conf)    
# 
#   nginx::upstream {"upstream":
#     ensure  => present,
#     host    => upstream.com,
#     port    => 8080,
#     pool    => 30,
#   }