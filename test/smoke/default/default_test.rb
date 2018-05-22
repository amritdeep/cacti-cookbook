# # encoding: utf-8

# Inspec test for recipe cacti::default

# The Inspec reference, with examples and extensive documentation, can be
# found at http://inspec.io/docs/reference/resources/

unless os.windows?
  # This is an example test, replace with your own test.
  describe user('root'), :skip do
    it { should exist }
  end
end

# This is an example test, replace it with your own test.
describe port(80), :skip do
  it { should_not be_listening }
end

## Test Package Installed

apache_pkg = ['httpd', 'httpd-devel']
db_pkg = ['mariadb-server']
php_pkg = ['php-mysql', 'php-pear', 'php-common', 'php-gd', 'php-devel', 'php', 'php-mbstring', 'php-cli']
snmp_pkg = ['php-snmp', 'net-snmp-utils', 'net-snmp-libs']
rrd_pkg = ['rrdtool']

package = (apache_pkg << db_pkg << php_pkg << snmp_pkg << rrd_pkg).flatten!

package.each do |pkg|
  describe package(pkg) do
    it { should be_installed }
  end
end

## Test Servicve
describe service('httpd') do
  # it { should be_enabled }
  it { should be_running }
end
