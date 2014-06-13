use strict;
use warnings;
use lib "";
use Queue;
use Test::More;

my $queue = Queue->new( Length => 7 );

for (my $i = 0; $i < 11; $i++) {
	$queue->add("test".$i);
}
my $size = $queue->size();
is( $size , 7 , "Size equals length when filled." );

done_testing();