use inc::Module::Install '0.68';

name 'Net-Akamai';
all_from 'lib/Net/Akamai.pm';

requires 'Moose' => '0.45';
requires 'MooseX::Types' => '0.04';
requires 'Digest::MD5' => '2.36';
requires 'SOAP::Lite' => '0.710.05';
requires 'Crypt::SSLeay' => '0.57'; # needed for SOAP::Lite https
requires 'MooseX::AttributeHelpers' => '0.09';
requires 'Text::Tabs';

# generate README file
if ($Module::Install::AUTHOR) {
  system('pod2text lib/Net/Akamai.pm > README');
}

tests_recursive();
auto_install;
WriteAll;

