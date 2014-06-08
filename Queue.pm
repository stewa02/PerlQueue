package Queue;
use strict;
use warnings;

# General Information:
*CREATOR = \"Stephan Wagner";
*VERSION = \"1.5.1b";
*PACKAGE = \"Queue";

sub new {
	my $type = shift;
    my %params = @_;
    my $self = {};
	if ($params{'Length'} =~ /\d+/) {
		$self->{'Length'} = $params{'Length'};
	}
	else {
		die "Warning: Non numeric argument!\n";
	}
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

sub full {
	my $self = shift;
	my $arraysize = @{$self->{'Data'}};
	if ($arraysize == $self->{'Length'}) {
		return 0;
	}
	else {
		return 1;
	}
}

sub empty {
	my $self = shift;
	my $arraysize = @{$self->{'Data'}};
	unless ($arraysize != 0 or defined $self->{'Data'}) {
		return 0;
	}
	else {
		return 1;
	}
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

sub length {
	my $self = shift;
	return $self->{'Length'};
}

sub size {
	my $self = shift;
	my $arraysize;
	$arraysize = @{$self->{'Data'}} if (defined $self->{'Data'});
	$arraysize = 0 unless (defined $self->{'Data'});
	return $arraysize;
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

sub dump {
	my ($self, $seperator) = @_;
	my $i = 0;
	my @output;
	my $output;
	if ($seperator eq "\n") {
		@output = map {
			my $index = $i;
			$i++;
			"\t".$i.": ".$_;
		} @{$self->{'Data'}};
		unshift(@output,"DATA \{");
		push(@output,"\}\n");
		$output = join($seperator,@output);
	}
	else {
		@output = @{$self->{'Data'}};
		push(@output,"\n");
		$output = join($seperator,@output);
	}
	return $output;
}

sub resize {
	my $self = shift;
	if (defined $_[0]) {
		my $length = shift;
		if ($length =~ /\d+/) {
			$self->{'Length'} = $length;
			return $length;
		}
		else {
			return 1;
		}
	}
	else {
		return $self->{'Length'};
	}
}

DESTROY {
	# Placeholder for upcoming destructor...
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

=head2 full

Returns if the queue is full (0) or not (1).

=head2 empty

Returns if the queue is empty (0) or not (1).

=head2 length

Returns the biggest possible size defined in the length-attribute.

=head2 size

Returns the current size of the queue.

=head2 dump

Dumps all entries of the queue.

=head2 resize

Resizes the instance of queue. If no new length is provided, the method will return the current length.

=cut