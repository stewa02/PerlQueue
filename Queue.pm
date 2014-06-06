package Queue;
use strict;
use warnings;

sub new {
	my $type = shift;
    my %params = @_;
    my $self = {};

    $self->{'Length'} = $params{'Length'};
	$self->{'Data'} = [];
    bless($self, $type);
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