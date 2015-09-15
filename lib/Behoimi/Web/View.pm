package Behoimi::Web::View;
use strict;
use warnings;
use utf8;
use Carp ();

use Text::Xslate;
use Behoimi::Web::ViewFunctions;

# setup view class
sub make_instance {
    my ($class, $context) = @_;
    Carp::croak("Usage: Behoimi::Web::View->make_instance(\$context_class)") if @_!=2;

    my $view_conf = $context->config->{'Text::Xslate'};
    my $view = Text::Xslate->new(+{
        'syntax'   => 'Kolon',
        'module'   => [
            'Text::Xslate::Bridge::Star',
            'Behoimi::Web::ViewFunctions',
        ],
        verbose => 2,
        %$view_conf
    });
    return $view;
}

1;
