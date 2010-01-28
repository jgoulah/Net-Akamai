use Test::More;

# to validly test this module you must set these env vars
#NET_AKAMAI_USERNAME -- akamai username with purge access
#NET_AKAMAI_PASSWORD -- akamai password
#NET_AKAMAI_EMAIL -- email to send purge results
#NET_AKAMAI_TESTURL -- a url test to test the purge
unless ($ENV{NET_AKAMAI_USERNAME} && $ENV{NET_AKAMAI_PASSWORD}
		&& $ENV{NET_AKAMAI_EMAIL} && $ENV{NET_AKAMAI_TESTURL}) {
	plan skip_all => 'set NET_AKAMAI_USERNAME, NET_AKAMAI_PASSWORD, NET_AKAMAI_EMAIL, NET_AKAMAI_TESTURL to enable this test' 
} else {
	plan tests => 7;
}

use_ok( 'Net::Akamai' ); 

my $data = new Net::Akamai::RequestData(
					email=>$ENV{NET_AKAMAI_EMAIL},
					user => $ENV{NET_AKAMAI_USERNAME},
					pwd => $ENV{NET_AKAMAI_PASSWORD},
				);
ok(defined $data, 'Net::Akamai::RequestData object is defined');

$data->add_url($ENV{NET_AKAMAI_TESTURL});

my $ap = new Net::Akamai(req_data=>$data);
ok(defined $ap, 'Net::Akamai object is defined');

$ap->purge();

# we cant really check 'Success' here, but we
# can check the value isn't the default
ok !($ap->res_data->result_msg eq '')
	=> "result message is defined"; 

$ap = new Net::Akamai();
ok(defined $ap, 'Net::Akamai object is defined');
isa_ok($ap, 'Net::Akamai', 'Net::Akamai object is Net::Akamai');
$ap->add_url($ENV{NET_AKAMAI_TESTURL});
$ap->email($ENV{NET_AKAMAI_EMAIL});
$ap->user($ENV{NET_AKAMAI_USERNAME});
$ap->pwd($ENV{NET_AKAMAI_PASSWORD});
$ap->purge();
ok !($ap->res_data->result_msg eq '')
	=> "result message is defined"; 
