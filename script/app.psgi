use strict;
use warnings;
use utf8;
use File::Spec;
use File::Basename;
use lib File::Spec->catdir(dirname(__FILE__), '..', 'lib');
use Plack::Builder;
use Plack::Builder::Conditionals;

use Behoimi;
use Behoimi::Web;

my $conf = Behoimi->config;

my $app = builder {
    enable 'HTTPExceptions';
    enable match_if addr(['127.0.0.1']),
        'BetterStackTrace',
            application_caller_subroutine => 'Amon2::Web::handle_request',
            no_print_errors               => 1;

    enable 'AxsLog',
        response_time      => 1,
        long_response_time => 500_000,
        error_only         => 1;
    enable 'Log::Minimal';

    enable 'Static',
        path => qr{^(?:/static/)},
        root => File::Spec->catdir(dirname(__FILE__), '..');
    enable 'Static',
        path => qr{^(?:/robots\.txt|/favicon\.ico)$},
        root => File::Spec->catdir(dirname(__FILE__), '..', 'static');

    Behoimi::Web->to_app();
};
