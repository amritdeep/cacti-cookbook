#
# Cookbook:: cacti
# Recipe:: default
#
# Copyright:: 2018, The Authors, All Rights Reserved.
package 'epel-release'

apache_pkg = ['httpd', 'httpd-devel']
db_pkg = ['mariadb-server']
php_pkg = ['php-mysql', 'php-pear', 'php-common', 'php-gd', 'php-devel', 'php', 'php-mbstring', 'php-cli']
snmp_pkg = ['php-snmp', 'net-snmp-utils', 'net-snmp-libs']
rrd_pkg = ['rrdtool']
service_pkg = %w[httpd mariadb snmpd]

packages = (apache_pkg << db_pkg << php_pkg << snmp_pkg << rrd_pkg).flatten!

packages.each do |pkg|
  package pkg
end

service_pkg.each do |srv|
  service srv do
    action [:enable, :start]
  end
end

package 'cacti'
