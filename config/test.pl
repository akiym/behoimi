use File::Spec;
use File::Basename qw(dirname);
my $basedir = File::Spec->rel2abs(File::Spec->catdir(dirname(__FILE__), '..'));
my $dbpath = File::Spec->catfile($basedir, 'db', 'test.db');
+{
    'DBI' => [
        "dbi:SQLite:dbname=$dbpath", '', '',
        +{
            sqlite_unicode => 1,
        }
    ],
    'Text::Xslate' => {
        path         => File::Spec->catdir($basedir, 'tmpl'),
        warn_handler => sub { Text::Xslate->print('[[', @_, ']]') },
    },
};
