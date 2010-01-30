#!/usr/bin/perl -w
use strict;
use warnings;

use Test::More;

BEGIN{ use_ok( 'Net::Akamai' ); }

my $data = new Net::Akamai::RequestData();
isa_ok($data, 'Net::Akamai::RequestData');

my $ap = new Net::Akamai(req_data=>$data);
isa_ok($ap, 'Net::Akamai');

subtest 'run purge' => sub {
	unless ($ENV{NET_AKAMAI_USERNAME} && $ENV{NET_AKAMAI_PASSWORD}
		&& $ENV{NET_AKAMAI_EMAIL} && $ENV{NET_AKAMAI_TESTURL}) {
		plan skip_all => 'set NET_AKAMAI_USERNAME, NET_AKAMAI_PASSWORD, NET_AKAMAI_EMAIL, NET_AKAMAI_TESTURL to enable this test';
	}

	$ap->add_url($ENV{NET_AKAMAI_TESTURL});
	$ap->email($ENV{NET_AKAMAI_EMAIL});
	$ap->user($ENV{NET_AKAMAI_USERNAME});
	$ap->pwd($ENV{NET_AKAMAI_PASSWORD});

	my $res = $ap->purge();

	ok( $res->successful(), 'purge was successful' );

	done_testing;
};

done_testing;
