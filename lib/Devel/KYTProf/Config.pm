package Devel::KYTProf::Config;
use strict;
use warnings;
use 5.008005;
our $VERSION = "0.01";

use Devel::KYTProf;
use YAML qw(LoadFile);
use Cwd qw(getcwd);
use File::Basename qw(dirname);

sub import {
    my $file = find_yaml();

    return unless $file;

    my $yaml = LoadFile($file);

    for my $module ( keys %$yaml ) {

        if ( ref $yaml->{$module} eq "ARRAY" ) {
            for my $method ( @{ $yaml->{$module} } ) {
                Devel::KYTProf->add_prof($module, $method);
            }
        }
        elsif ( $yaml->{$module} eq ":all" ) {
            Devel::KYTProf->add_profs($module, ":all");
        }
    }
}

# steel from https://github.com/xaicron/mysqlenv/blob/master/lib/App/mysqlenv/Util.pm
sub find_yaml {
    my $dir = getcwd();
    my $file_name = $ENV{"DEVEL_KYTPROF_CONFIG"} || ".kytprof.yaml";

    my %seen;
    while ( -d $dir ) {
        return undef if $seen{$dir}++; # for symlink
        if ( -f "$dir/$file_name" ) {
            return "$dir/$file_name";
        }

        $dir = dirname $dir;
    }

    return undef;
}


1;
__END__

=head1 NAME

Devel::KYTProf::Config - use Devel::KYTProf and add profile by yaml config file.

=head1 SYNOPSIS

    perl -MDevel::KYTProf::Config ...

=head1 DESCRIPTION

Devel::KYTProf::Config is adding L<Devel::KYTProf> profile by yaml config file.

When Devel::KYTProf::Config is imported, start to search .kytprof.yaml.
If you want to add specific module method to L<Devel::KYTProf> profile, write to
.kytprof.yaml like this.

    ---
    "Text::Xslate"
        - render

Also you can add all methods of module to profile like this.

    ---
    "Text::Xslate" : ":all"

=head1 SEE ALSO

L<Devel::KYTProf>

=head1 LICENSE

Copyright (C) soh335

This library is free software; you can redistribute it and/or modify
it under the same terms as Perl itself.

=head1 AUTHOR

soh335 E<lt>sugarbabe335@gmail.comE<gt>

