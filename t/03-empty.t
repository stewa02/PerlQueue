use strict;
use warnings;
use lib "";
use Queue;
use Test::More;

my $queue = Queue->new( Length => 7 );
my $empty = $queue->empty();
is( $empty , 0 , "Queue empty as expected." );
$queue->add("test0");
$empty = $queue->empty();
is( $empty , 1 , "Not empty after adding value." );
done_testing();