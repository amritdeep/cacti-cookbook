#
# Cookbook:: cacti
# Recipe:: default
#
# Copyright:: 2018, The Authors, All Rights Reserved.
['httpd', 'httpd-devel', 'mariadb-server', 'php-mysql', 'php-pear',
  'php-common', 'php-gd', 'php-devel', 'php', 'php-mbstring', 'php-cli',
  'php-snmp', 'net-snmp-utils', 'net-snmp-libs', 'rrdtool'].each do |pkg|
    package pkg
  end
