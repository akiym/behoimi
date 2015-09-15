package Behoimi::Web::Request;
use strict;
use warnings;
use utf8;
use parent qw/Amon2::Web::Request/;
use Carp ();

sub param {
    my ($self, $key) = @_;
    unless (exists $self->parameters->{$key}) {
        Carp::croak("Missing parameter: $key");
    }
    return $self->parameters->{$key};
}

sub capture_params {
    my ($self, @keys) = @_;
    my %params;
    for my $key (@keys) {
        $params{$key} = $self->param($key);
    }
    return %params;
}

1;

