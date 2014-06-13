use strict;
use warnings;
use lib "";
use Queue;
use Test::More;

my $queue = Queue->new( Length => 7 );

for (my $i = 0; $i < 11; $i++) {
	$queue->add("test".$i);
}
my $over = $queue->add("oversizing");
is( $over , 1 , "Queue can't be oversized." );

done_testing();