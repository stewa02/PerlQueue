use strict;
use warnings;
use lib "";
use Queue;
use Test::More;

my $queue = Queue->new( Length => 7 );

my $add = $queue->add("test");
is( $add , 0 , "Item successfully added to queue." );

my $get = $queue->get();
is( $get , "test" , "Item successfully recieved." );

done_testing();