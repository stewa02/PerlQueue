use strict;
use warnings;
use lib "";
use Queue;
use Test::More;

my $queue = Queue->new( Length => 7 );

$queue->resize = 10;
my $length = $queue->length();
is( $length , 10 , "Resize was correctly applied." );

done_testing();