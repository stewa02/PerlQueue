use strict;
use warnings;
use lib "";
use Queue;
use Test::More;

my $queue = Queue->new( Length => 7 );
my $full = $queue->full();
is( $full , 1 , "Queue not full as expected." );

for (my $i = 0; $i < 11; $i++) {
	$queue->add("test".$i);
}
$full = $queue->full();
is( $full , 0 , "Full after filling" );
done_testing();