use strict;
use warnings;
use lib "";
use Queue;
use Test::More;

# Constructor tests
my $queue = Queue->new( Length => 7 );
ok( $queue , "Constructor works with integer." );
my $length = $queue->length();
is( $length , 7 , "Length is correct." );
eval { my $testqueue = Queue->new( Length => "str" ); };
like( $@ ,  qr/Non numeric/ , "Died with wrong length argument." );
done_testing();