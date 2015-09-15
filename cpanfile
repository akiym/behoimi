requires 'perl', '5.020';

requires 'Amon2', '6.12';
requires 'Text::Xslate', '3.3.7';
requires 'Router::Boom', '1.02';

requires 'Data::Validator';
requires 'FormValidator::Lite';
requires 'HTML::FillInForm::Lite';
requires 'HTTP::Throwable';
requires 'JSON', '2.90';
requires 'Module::Functions';
requires 'Time::Piece', '1.30';

requires 'Teng', '0.28';
requires 'DBD::SQLite', '1.48';

requires 'HTTP::Session2', '1.03';
requires 'Crypt::CBC';
requires 'Crypt::Rijndael';

requires 'Proclet';
requires 'Plack::Builder::Conditionals';
requires 'Plack::Middleware::BetterStackTrace';
requires 'Plack::Middleware::AxsLog';

on configure => sub {
    requires 'Module::Build', '0.38';
    requires 'Module::CPANfile', '0.9010';
};

on test => sub {
    requires 'Test::More', '0.98';
    requires 'Test::WWW::Mechanize::PSGI';
};
