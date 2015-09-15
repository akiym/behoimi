package Behoimi::Web::Dispatcher;
use v5.20;
use warnings;
use utf8;
use Behoimi::Web::Dispatcher::RouterBoom;
use FormValidator::Lite;

any '/' => sub {
    my ($c) = @_;
    return $c->render('index.tx');
};

1;
