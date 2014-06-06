package Queue;
use strict;
use warnings;

# General Information:
*CREATOR = \"Stephan Wagner";
*VERSION = \1.0;
*PACKAGE = \"Queue";

sub new {
	my $type = shift;
    my %params = @_;
    my $self = {};

    $self->{'Length'} = $params{'Length'};
	$self->{'Data'} = [];
    bless($self, $type);
}

sub pick {
	my $self = shift;
	my $pickitem = $self->{'Data'}[0];
	return $pickitem;
}

sub clear {
	my $self = shift;
	undef($self->{'Data'});
}

sub delete {
	my $self = shift;
	my $delitem = shift($self->{'Data'});
	undef($delitem);
}

sub get {
	my $self = shift;
	my $getitem = shift($self->{'Data'});
	return $getitem;
}

sub add {
	my ($self, $additem) = @_;
	my $arraysize = @{$self->{'Data'}};
	unless ($arraysize == $self->{'Length'}) {
		push($self->{'Data'},$additem);
		return 0;
	}
	else {
		return 1;
	}
}

1;

__END__

=pod

=encoding utf-8

=head1 NAME

Queue - Simple object oriented queue

=head1 VERSION

version 1.0

=head1 DESCRIPTION

The Queue module is the simplest object oriented package for creating
queues.

=head1 METHODS

=head2 new

Creates a new instance of a queue object.

=head2 add [ELEMENT]

Adds the a specified element to the queue.

=head2 get 

Returns the first element in the queue and deletes the element from the queue.

=head2 delete

Removes the first element in the queue without returning it.

=head2 clear

Removes all elements from the queue.

=head2 pick

Returns the first element of the queue, without removing it.

=cut