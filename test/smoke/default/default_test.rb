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
packages = (apache_pkg << db_pkg << php_pkg << snmp_pkg << rrd_pkg).flatten!
service_pkg = %w[httpd mariadb snmpd]

packages.each do |pkg|
  describe package(pkg) do
    it { should be_installed }
  end
end

describe package('epel-release') do
  it { should be_installed }
end

## Test Servicve
service_pkg.each do |ser|
  describe service(ser) do
    it { should be_enabled }
    it { should be_running }
  end
end

describe package('cacti') do
  it { should be_installed }
end

describe file('/etc/httpd/conf.d/cacti.conf') do
  it { should exist }
  it { should be_file }
  its('content') { should match /Require all granted/ }
  its('content') { should match /Allow from all/ }
  its('owner') { should cmp 'root' }
  its('group') { should cmp 'root' }
  its('mode') { should cmp '0755' }
end

describe file('/etc/cron.d/cacti') do
  it { should exist }
  it { should be_file }
  its('content') { should match /cacti/ }
  its('owner') { should cmp 'root' }
  its('group') { should cmp 'root' }
  its('mode') { should cmp '0755' }
end

describe service('firewalld') do
  it { should be_enabled }
  it { should be_running }
  # its('zone') { should eq 'public' }
  # it { should has_zone('public') }
end
