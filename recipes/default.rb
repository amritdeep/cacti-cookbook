#
# Cookbook:: cacti
# Recipe:: default
#
# Copyright:: 2018, The Authors, All Rights Reserved.

apache_pkg = ['httpd', 'httpd-devel']
db_pkg = ['mariadb-server']
php_pkg = ['php-mysql', 'php-pear', 'php-common', 'php-gd', 'php-devel', 'php', 'php-mbstring', 'php-cli']
snmp_pkg = ['php-snmp', 'net-snmp-utils', 'net-snmp-libs']
rrd_pkg = ['rrdtool']

pkg = (apache_pkg << db_pkg << php_pkg << snmp_pkg << rrd_pkg).flatten!

pkg.each do |pkg|
  package pkg
end
