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

package = ['httpd', 'httpd-devel', 'mariadb-server', 'php-mysql', 'php-pear',
  'php-common', 'php-gd', 'php-devel', 'php', 'php-mbstring', 'php-cli',
  'php-snmp', 'net-snmp-utils', 'net-snmp-libs', 'rrdtool']

package.each do |pkg|
  describe package(pkg) do
    it { should be_installed }
  end
end


# describe package('httpd') do
#   it { should be_installed }
# end
#
# describe package('httpd-devel') do
#   it { should be_installed }
# end
#
# describe package('mariadb-server') do
#   it { should be_installed }
# end
#
# describe package('php-mysql') do
#   it { should be_installed }
# end
#
# describe package('php-pear') do
#   it { should be_installed }
# end
#
# describe package('php-common') do
#   it { should be_installed }
# end
#
# describe package('php-gd') do
#   it { should be_installed }
# end
#
# describe package('php-devel') do
#   it { should be_installed }
# end
#
# describe package('php') do
#   it { should be_installed }
# end
#
# describe package('php-mbstring') do
#   it { should be_installed }
# end
#
# describe package('php-cli') do
#   it { should be_installed }
# end
#
# describe package('php-snmp') do
#   it { should be_installed }
# end
#
# describe package('net-snmp-utils') do
#   it { should be_installed }
# end
#
# describe package('net-snmp-libs') do
#   it { should be_installed }
# end
#
# describe package('rrdtool') do
#   it { should be_installed }
# end
