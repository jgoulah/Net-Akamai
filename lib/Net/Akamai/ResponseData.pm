package Net::Akamai::ResponseData;

use Moose;

=head1 NAME
    
Net::Akamai::ResponseData - Object to hold response data 
    
=head1 DESCRIPTION

Data container for an akamai purge response 

=cut

=head1 Attributes

=head2 uri_index 

Identifies the index of the first failed URL in the array.
A value of -1 indicates no bad URLs, or error before parsing them.

=cut
has 'uri_index' => (
	is => 'ro', 
	isa => 'Int',
	required => 1,
	default => '-1',
);


=head2 result_code 

Indicates sucess or failure of request

=cut
has 'result_code' => (
	is => 'ro', 
	isa => 'Int',
	required => 1,
	default => '0',
);


=head2 est_time 

Estimated time for request to be processed in seconds

=cut
has 'est_time' => (
	is => 'ro', 
	isa => 'Int',
	required => 1,
	default => '0',
);


=head2 session_id 

Unique id for request

=cut
has 'session_id' => (
	is => 'ro', 
	isa => 'Str',
	required => 1,
	default => '',
);


=head2 result_msg 

Explains result code

=cut
has 'result_msg' => (
	is => 'ro', 
	isa => 'Str',
	required => 1,
	default => '',
);



=head1 AUTHOR

John Goulah  <jgoulah@cpan.org>

=head1 LICENSE

This library is free software, you can redistribute it and/or modify
it under the same terms as Perl itself.

=cut

1;
