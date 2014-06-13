use strict;
use warnings;
use lib "";
use Queue;
use Test::More;

my $queue = Queue->new( Length => 7 );

$queue->add("test0");
$queue->clear();
eval { $queue->add("test"); };
unlike( $@ ,  qr/value/ , "Value successfully added." );

done_testing();