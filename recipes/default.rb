#
# Cookbook:: cacti
# Recipe:: default
#
# Copyright:: 2018, The Authors, All Rights Reserved.
# firewall 'default'

package 'epel-release'
apache_pkg = ['httpd', 'httpd-devel']
db_pkg = ['mariadb-server']
php_pkg = ['php-mysql', 'php-pear', 'php-common', 'php-gd', 'php-devel', 'php', 'php-mbstring', 'php-cli']
snmp_pkg = ['php-snmp', 'net-snmp-utils', 'net-snmp-libs']
rrd_pkg = ['rrdtool']
service_pkg = %w[httpd mariadb snmpd firewalld]

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

## Copy Configuration Files
cookbook_file '/etc/httpd/conf.d/cacti.conf' do
  source 'cacti.conf'
  owner 'root'
  group 'root'
  mode '0755'
  action :create
end

cookbook_file '/etc/cron.d/cacti' do
  source 'cacti_cron'
  owner 'root'
  group 'root'
  mode '0755'
  action :create
end

firewalld_service 'http' do
	action :add
	zone   'public'
end

service 'firewalld' do
  action [:reload, :restart]
end
