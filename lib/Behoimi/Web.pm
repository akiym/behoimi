package Behoimi::Web;
use v5.20;
use warnings;
use utf8;
use parent qw/Behoimi Amon2::Web/;

use Behoimi::Web::Request;
sub create_request { Behoimi::Web::Request->new($_[1], $_[0]) }

use Behoimi::Web::Dispatcher;
sub dispatch {
    return (Behoimi::Web::Dispatcher->dispatch($_[0]) or die "response is not generated");
}

use HTTP::Throwable::Factory;
sub throw_redirect {
    my $c = shift;
    my $res = $c->redirect(@_);
    HTTP::Throwable::Factory->throw(Found => {
        location => $res->location,
    });
}

__PACKAGE__->load_plugins(
    'Web::FillInFormLite',
    'Web::JSON',
    '+Behoimi::Web::Plugin::Session',
);

use Behoimi::Web::View;
{
    sub create_view {
        my $view = Behoimi::Web::View->make_instance(__PACKAGE__);
        no warnings 'redefine';
        *Behoimi::Web::create_view = sub { $view }; # Class cache.
        $view
    }
}

# for your security
__PACKAGE__->add_trigger(
    AFTER_DISPATCH => sub {
        my ($c, $res) = @_;

        # http://blogs.msdn.com/b/ie/archive/2008/07/02/ie8-security-part-v-comprehensive-protection.aspx
        $res->header( 'X-Content-Type-Options' => 'nosniff' );

        # http://blog.mozilla.com/security/2010/09/08/x-frame-options/
        $res->header( 'X-Frame-Options' => 'DENY' );

        # Cache control.
        $res->header( 'Cache-Control' => 'private' );
    },
);

1;
