use strict;
use warnings;
use lib "C:\\Users\\sw\\Desktop";
use Queue;
use Test::More;

# Testing file for Queue V1.7
# Editor: 	Stephan Wagner
# File version: 1.1.0

print qq{
Testing file for Queue V1.7
Author:		Stephan Wagner
File version:	1.1.0

};

# Constructor tests
my $queue = Queue->new( Length => 7 );
ok( $queue , "Constructor works with integer." );
my $length = $queue->length();
is( $length , 7 , "Length is correct." );
eval { my $testqueue = Queue->new( Length => "str" ); };
like( $@ ,  qr/Non numeric/ , "Died with wrong length argument." );

# Full/Empty functions
my $empty = $queue->empty();
is( $empty , 0 , "Queue empty as expected." );
my $full = $queue->full();
is( $full , 1 , "Queue not full as expected." );
$queue->add("test0");
$empty = $queue->empty();
is( $empty , 1 , "Not empty after adding value." );
for (my $i = 0; $i < 11; $i++) {
	$queue->add("test".$i);
}
$full = $queue->full();
is( $full , 0 , "Full after filling" );

# Size function
my $size = $queue->size();
is( $size , 7 , "Size equals length when filled." );

# Resize function / Resizing queue
$queue->resize = 10;
$length = $queue->length();
is( $length , 10 , "Resize was correctly applied." );

# Testing clear function
$queue->clear();
eval { $queue->add("test"); };
unlike( $@ ,  qr/value/ , "Value successfully added." );

# Basic functionalities
for (my $i = 0; $i < 11; $i++) {
	$queue->add("test".$i);
}
my $over = $queue->add("oversizing");
is( $over , 1 , "Queue can't be oversized." );

done_testing();