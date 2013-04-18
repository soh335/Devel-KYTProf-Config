use strict;
use warnings;

BEGIN {
    use FindBin;
    use Cwd qw(getcwd);
    $ENV{DEVEL_KYTPROF_CONFIG} = "t/.kytprof.yaml";
}

use Test::More;
use Devel::KYTProf::Config;
use Devel::KYTProf;

ok +Devel::KYTProf->_orig_code->{"File::Spec"}->{"catfile"}, "load config file by environment variables";

done_testing;
