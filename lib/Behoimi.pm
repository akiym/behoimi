package Behoimi;
use v5.20;
use warnings;
use utf8;
use parent qw/Amon2/;
our $VERSION='0.01';

use Hash::Util;

use Behoimi::DB;
use Behoimi::DB::Schema;

sub load_config {
    my $class = shift;
    my $config = Amon2::Config::Simple->load($class);
    Hash::Util::lock_keys(%$config);
    return $config;
}

sub db {
    my $c = shift;
    $c->{db} //= Behoimi::DB->new(
        schema       => Behoimi::DB::Schema->instance,
        connect_info => $c->config->{DBI},
    );
}

1;
